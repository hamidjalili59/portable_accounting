import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_item.freezed.dart';

@freezed
class SaleItem with _$SaleItem {
  SaleItem({
    required this.id,
    required this.inventoryItemId,
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  final int id;
  @override
  final int inventoryItemId;
  @override
  final String name;
  @override
  final int quantity;
  @override
  final double price;
}
