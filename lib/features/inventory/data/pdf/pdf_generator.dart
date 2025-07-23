import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:portable_accounting/core/helpers/currency_formatter.dart';
import 'package:portable_accounting/core/services/currency_service.dart';
import 'package:portable_accounting/features/sales/domain/entities/invoice.dart';

class PdfInvoiceGenerator {
  static Future<Uint8List> generate(
    Invoice invoice,
    CurrencyUnit currencyUnit,
  ) async {
    final pdf = pw.Document();

    // فونت فارسی را از assets لود می‌کنیم
    final fontData = await rootBundle.load(
      "assets/fonts/Vazirmatn-Regular.ttf",
    );
    final ttf = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.Page(
        // تنظیم جهت صفحه به راست به چپ
        pageFormat: PdfPageFormat.a4,
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(base: ttf, bold: ttf, italic: ttf),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('فاکتور فروش', style: pw.TextStyle(fontSize: 24)),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('شماره فاکتور: ${invoice.id}'),
                  pw.Text(
                    'تاریخ: ${invoice.date.toLocal().toString().split(' ')[0]}',
                  ),
                ],
              ),
              pw.Text('مشتری: ${invoice.customerName ?? "نامشخص"}'),
              pw.Divider(height: 30),
              // جدول آیتم‌ها
              _buildItemsTable(invoice, currencyUnit),
              pw.Spacer(),
              pw.Divider(),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text('جمع کل: ', style: pw.TextStyle(fontSize: 16)),
                  pw.Text(
                    invoice.totalPrice.formatAsCurrency(currencyUnit),
                    style: pw.TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  static pw.Widget _buildItemsTable(
    Invoice invoice,
    CurrencyUnit currencyUnit,
  ) {
    final headers = ['شرح کالا', 'تعداد', 'قیمت واحد', 'مبلغ کل'];
    final data = invoice.items.map((item) {
      return [
        item.name,
        item.quantity.toString(),
        item.price.formatAsCurrency(currencyUnit),
        (item.quantity * item.price).formatAsCurrency(currencyUnit),
      ];
    }).toList();

    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: data,
      border: pw.TableBorder.all(),
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      cellAlignment: pw.Alignment.center,
      headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
      cellStyle: const pw.TextStyle(fontSize: 10),
      columnWidths: {
        0: const pw.FlexColumnWidth(3),
        1: const pw.FlexColumnWidth(1),
        2: const pw.FlexColumnWidth(2),
        3: const pw.FlexColumnWidth(2),
      },
    );
  }
}
