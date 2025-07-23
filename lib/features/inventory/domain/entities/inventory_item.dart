import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_item.freezed.dart';

@freezed
class InventoryItem with _$InventoryItem {
  InventoryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.purchasePrice,
    required this.salePrice,
    this.imagePath,
  });

  @override
  final int id;
  @override
  final String name;
  @override
  final int quantity;
  @override
  final double purchasePrice;
  @override
  final double salePrice;
  @override
  final String? imagePath;
}
