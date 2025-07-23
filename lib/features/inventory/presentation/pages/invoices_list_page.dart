import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pdf/pdf.dart' show PdfPageFormat;
import 'package:portable_accounting/core/helpers/currency_formatter.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:portable_accounting/core/widgets/empty_state_widget.dart';
import 'package:portable_accounting/features/inventory/data/pdf/pdf_generator.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/invoice_list_bloc.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import 'package:printing/printing.dart';

class InvoicesListPage extends StatelessWidget {
  const InvoicesListPage({super.key});

  Future<void> _generateAndPrintPdf(
    Invoice invoice,
    CurrencyUnit currencyUnit,
  ) async {
    final pdfBytes = await PdfInvoiceGenerator.generate(invoice, currencyUnit);
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfBytes,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.page_invoices)),
      body: BlocBuilder<InvoiceListBloc, InvoiceListState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            loaded: (invoices) {
              if (invoices.isEmpty) {
                return EmptyStateWidget(
                  icon: Icons.receipt_long_outlined,
                  title: l10n.invoices_emptyTitle,
                  message: l10n.invoices_emptyMessage,
                  buttonText: l10n.invoices_createFirst,
                  onButtonPressed: () {
                    // کاربر را به صفحه ایجاد فاکتور هدایت می‌کنیم
                    context.push('/create-invoice');
                  },
                );
              }
              final currencyUnit = context.watch<CurrencyCubit>().state;

              return ListView.builder(
                itemCount: invoices.length,
                itemBuilder: (context, index) {
                  final invoice = invoices[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      title: Text(l10n.invoices_invoiceNumber(invoice.id)),
                      subtitle: Text(
                        '${l10n.invoices_customer}: ${invoice.customerName} - ${l10n.invoices_date}: ${invoice.date}',
                      ),
                      trailing: Text(
                        invoice.totalPrice.formatAsCurrency(currencyUnit),
                      ),
                      leading: IconButton(
                        icon: const Icon(Icons.print_outlined),
                        onPressed: () {
                          final currencyUnit = context
                              .read<CurrencyCubit>()
                              .state;

                          _generateAndPrintPdf(invoice, currencyUnit);
                        },
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
