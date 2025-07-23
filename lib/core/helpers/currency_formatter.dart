import 'package:intl/intl.dart';
import '../services/currency_service.dart';

extension CurrencyFormatting on double {
  String formatAsCurrency(CurrencyUnit unit) {
    final value = this / unit.divisor;
    final formatter = NumberFormat('#,##0.##');
    return '${formatter.format(value)} ${unit.displayName}';
  }
}
