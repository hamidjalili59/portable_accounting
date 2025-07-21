import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portable_accounting/features/sales/domain/entities/sale_item.dart';

part 'invoice.freezed.dart';

@freezed
class Invoice with _$Invoice {
  Invoice({
    required this.id,
    required this.date,
    required this.items,
    required this.totalPrice,
    this.customerName,
  });

  @override
  final int id;
  @override
  final DateTime date;
  @override
  final List<SaleItem> items;
  @override
  final double totalPrice;
  @override
  final String? customerName;
}
