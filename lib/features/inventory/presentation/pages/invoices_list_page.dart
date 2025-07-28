import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart' show PdfPageFormat;
import 'package:portable_accounting/core/l10n/app_localizations.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/helpers/currency_formatter.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:portable_accounting/core/widgets/empty_state_widget.dart';
import 'package:portable_accounting/features/inventory/data/pdf/pdf_generator.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/invoice_list_bloc.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

class InvoicesListPage extends StatefulWidget {
  const InvoicesListPage({super.key});

  @override
  State<InvoicesListPage> createState() => _InvoicesListPageState();
}

class _InvoicesListPageState extends State<InvoicesListPage> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    // Trigger the initial load of invoices for the default date range.
    context.read<InvoiceListBloc>().add(const InvoiceListEvent.load());
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  /// Debounces search input to prevent firing events on every keystroke.
  void _onSearchChanged(String query, InvoiceListState currentState) {
    if (currentState is! Loaded) return;
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<InvoiceListBloc>().add(InvoiceListEvent.load(
        startDate: currentState.startDate,
        endDate: currentState.endDate,
        searchQuery: query,
      ));
    });
  }

  /// Shows the date picker and triggers a reload with the new date.
  Future<void> _selectDate(bool isStartDate, Loaded currentState) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate ? currentState.startDate : currentState.endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && mounted) {
      final newStartDate = isStartDate ? pickedDate : currentState.startDate;
      final newEndDate = isStartDate ? currentState.endDate : pickedDate;
      context.read<InvoiceListBloc>().add(InvoiceListEvent.load(
        startDate: newStartDate,
        endDate: newEndDate,
        searchQuery: currentState.searchQuery,
      ));
    }
  }

  /// Generates a PDF and opens the system's print dialog.
  Future<void> _generateAndPrintPdf(Invoice invoice, CurrencyUnit currencyUnit) async {
    final pdfBytes = await PdfInvoiceGenerator.generate(invoice, currencyUnit);
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfBytes);
  }

  /// Generates a PDF and opens the system's share sheet.
  Future<void> _generateAndSharePdf(Invoice invoice, CurrencyUnit currencyUnit) async {
    final l10n = context.l10n;
    final pdfBytes = await PdfInvoiceGenerator.generate(invoice, currencyUnit);
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/invoice_${invoice.id}.pdf';
    final file = File(filePath);
    await file.writeAsBytes(pdfBytes);

    final shareText = '${l10n.invoices_invoiceNumber(invoice.id)} - ${l10n.invoices_customer}: ${invoice.customerName ?? l10n.global_na}';
    await SharePlus.instance.share(
      ShareParams(files: [XFile(filePath)], text: shareText),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final currencyUnit = context.watch<CurrencyCubit>().state;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.page_invoices)),
      body: BlocBuilder<InvoiceListBloc, InvoiceListState>(
        builder: (context, state) {
          // Sync the search controller text with the BLoC state
          if (state is Loaded && _searchController.text != state.searchQuery) {
            _searchController.text = state.searchQuery;
          }

          return Column(
            children: [
              // --- Filter Controls Section ---
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildFilterControls(l10n, state),
              ),
              const Divider(height: 1),
              // --- Results Section ---
              Expanded(
                child: state.when(
                  initial: () => const Center(child: Text('Applying filters...')),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (message) => Center(child: Text(message)),
                  loaded: (invoices, _, __, ___) {
                    if (invoices.isEmpty) {
                      return EmptyStateWidget(
                        icon: Icons.receipt_long_outlined,
                        title: l10n.invoices_emptyTitle,
                        message: l10n.invoices_emptyMessage,
                        buttonText: l10n.invoices_createFirst,
                        onButtonPressed: () => context.push('/create-invoice'),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: invoices.length,
                      itemBuilder: (context, index) {
                        final invoice = invoices[index];
                        final customerName = invoice.customerName ?? l10n.global_na;
                        final date = DateFormat('yyyy-MM-dd').format(invoice.date.toLocal());

                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: ListTile(
                            title: Text(l10n.invoices_invoiceNumber(invoice.id)),
                            subtitle: Text('${l10n.invoices_customer}: $customerName - ${l10n.invoices_date}: $date'),
                            trailing: Text(invoice.totalPrice.formatAsCurrency(currencyUnit)),
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.print_outlined),
                                  tooltip: l10n.global_print,
                                  onPressed: () => _generateAndPrintPdf(invoice, currencyUnit),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.share_outlined),
                                  tooltip: l10n.global_share,
                                  onPressed: () => _generateAndSharePdf(invoice, currencyUnit),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Builds the filter controls UI (search bar and date pickers).
  Widget _buildFilterControls(AppLocalizations l10n, InvoiceListState state) {
    if (state is! Loaded) return const SizedBox.shrink();

    return Column(
      children: [
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: l10n.reports_search_by_name,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onChanged: (query) => _onSearchChanged(query, state),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: ElevatedButton.icon(onPressed: () => _selectDate(true, state), icon: const Icon(Icons.calendar_today), label: Text(l10n.reports_from(DateFormat('yyyy-MM-dd').format(state.startDate))))),
            const SizedBox(width: 12),
            Expanded(child: ElevatedButton.icon(onPressed: () => _selectDate(false, state), icon: const Icon(Icons.calendar_today), label: Text(l10n.reports_to(DateFormat('yyyy-MM-dd').format(state.endDate))))),
          ],
        ),
      ],
    );
  }
}