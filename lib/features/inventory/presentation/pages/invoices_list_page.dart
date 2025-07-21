import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart' show PdfPageFormat;
import 'package:portable_accounting/features/inventory/data/pdf/pdf_generator.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/invoice_list_bloc.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';
import 'package:printing/printing.dart';


class InvoicesListPage extends StatelessWidget {
  const InvoicesListPage({super.key});

  Future<void> _generateAndPrintPdf(Invoice invoice) async {
    final pdfBytes = await PdfInvoiceGenerator.generate(invoice);
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfBytes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('لیست فاکتورها')),
      body: BlocBuilder<InvoiceListBloc, InvoiceListState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            loaded: (invoices) {
              if (invoices.isEmpty) {
                return const Center(child: Text('هیچ فاکتوری ثبت نشده است.'));
              }
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
                      title: Text('فاکتور شماره: ${invoice.id}'),
                      subtitle: Text(
                        'مشتری: ${invoice.customerName ?? "نامشخص"} - تاریخ: ${invoice.date.toLocal().toString().split(' ')[0]}',
                      ),
                      trailing: Text(
                        '${invoice.totalPrice.toStringAsFixed(0)} تومان',
                      ),
                      leading: IconButton(
                        icon: const Icon(Icons.print_outlined),
                        onPressed: () {
                          _generateAndPrintPdf(invoice);
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
