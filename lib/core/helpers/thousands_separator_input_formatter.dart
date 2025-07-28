import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // ۱. حذف کاماهای قبلی و هر کاراکتر غیرعددی
    final cleanText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanText.isEmpty) {
      return const TextEditingValue();
    }

    // ۲. تبدیل به عدد و فرمت‌بندی با کاما
    final number = int.parse(cleanText);
    final formatter = NumberFormat('#,###');
    final newFormattedText = formatter.format(number);

    // ۳. بازگرداندن مقدار جدید با حفظ جایگاه مکان‌نما
    return newValue.copyWith(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: newFormattedText.length),
    );
  }
}
