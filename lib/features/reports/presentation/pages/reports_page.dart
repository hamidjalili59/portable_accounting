import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:portable_accounting/core/helpers/currency_formatter.dart';
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:portable_accounting/features/reports/presentation/bloc/reports_bloc.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  // متغیرهایی برای نگهداری تاریخ‌های انتخاب شده
  DateTime _startDate = DateTime.now().subtract(const Duration(days: 30));
  DateTime _endDate = DateTime.now();
  final DateFormat _formatter = DateFormat('yyyy-MM-dd');

  // متد برای نمایش انتخابگر تاریخ
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? _startDate : _endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyUnit = context.watch<CurrencyCubit>().state;
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.page_reports)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.reports_selectDateRange,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            // بخش انتخاب تاریخ
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: Text(l10n.reports_from(_formatter.format(_startDate))),
                    onPressed: () => _selectDate(context, true),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: Text(l10n.reports_to(_formatter.format(_endDate))),
                    onPressed: () => _selectDate(context, false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // دکمه تولید گزارش
            FilledButton(
              onPressed: () {
                context.read<ReportsBloc>().add(
                  ReportsEvent.generateReport(start: _startDate, end: _endDate),
                );
              },
              child: Text(l10n.reports_generateButton),
            ),
            const Divider(height: 32),
            // بخش نمایش نتایج گزارش (فعلاً خالی)
            Expanded(
              child: BlocBuilder<ReportsBloc, ReportsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () =>
                        Center(child: Text(l10n.reports_initialMessage)),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (message) => Center(
                      child: Text(
                        message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    loaded: (invoices) {
                      if (invoices.isEmpty) {
                        return Center(
                          child: Text(l10n.reports_noSalesFound),
                        );
                      }
                      return _buildReportResult(invoices, currencyUnit);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ویجت جدید برای نمایش نتایج گزارش
  Widget _buildReportResult(List<Invoice> invoices, CurrencyUnit currencyUnit) {
    final totalRevenue = invoices.fold<double>(
      0,
      (sum, inv) => sum + inv.totalPrice,
    );
    final l10n = context.l10n;
    return Column(
      children: [
        // خلاصه گزارش
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(l10n.reports_totalInvoices(invoices.length)),
                Text(
                  l10n.reports_totalRevenue(totalRevenue.formatAsCurrency(currencyUnit)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // لیست فاکتورها
        Expanded(
          child: ListView.builder(
            itemCount: invoices.length,
            itemBuilder: (context, index) {
              final invoice = invoices[index];
              return ListTile(
                title: Text(
                  '${l10n.invoices_invoiceNumber(invoice.id)} - ${invoice.customerName ?? l10n.global_na}',
                ),
                subtitle: Text(_formatter.format(invoice.date)),
                trailing: Text(
                  invoice.totalPrice.formatAsCurrency(currencyUnit),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
