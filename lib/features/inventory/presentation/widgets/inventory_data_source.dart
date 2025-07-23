import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../core/helpers/currency_formatter.dart';
import '../../../../core/services/currency_service.dart';
import '../../domain/entities/inventory_item.dart';

/// Connects a list of inventory items to the SfDataGrid widget.
/// It is responsible for creating the rows and building the UI for each cell,
/// using the provided currency unit for formatting.
class InventoryDataSource extends DataGridSource {
  final List<InventoryItem> _inventoryItems;
  final CurrencyUnit currencyUnit;
  final Function(InventoryItem) onEdit;
  final Function(InventoryItem) onDelete;

  InventoryDataSource({
    required List<InventoryItem> inventoryItems,
    required this.currencyUnit,
    required this.onEdit,
    required this.onDelete,
  }) : _inventoryItems = inventoryItems {
    _buildDataGridRows();
  }

  List<DataGridRow> _dataGridRows = [];

  @override
  List<DataGridRow> get rows => _dataGridRows;

  void _buildDataGridRows() {
    _dataGridRows = _inventoryItems.map<DataGridRow>((item) {
      return DataGridRow(
        cells: [
          DataGridCell<InventoryItem>(columnName: 'image', value: item),
          DataGridCell<String>(columnName: 'name', value: item.name),
          DataGridCell<InventoryItem>(columnName: 'quantity', value: item),
          DataGridCell<double>(
            columnName: 'purchasePrice',
            value: item.purchasePrice,
          ),
          DataGridCell<double>(columnName: 'salePrice', value: item.salePrice),
          DataGridCell<InventoryItem>(columnName: 'actions', value: item),
        ],
      );
    }).toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        switch (cell.columnName) {
          case 'image':
            return _buildImageCell(cell.value as InventoryItem);
          case 'quantity':
            return _buildQuantityCell((cell.value as InventoryItem).quantity);
          case 'purchasePrice':
          case 'salePrice':
            return _buildPriceCell(cell.value as double, currencyUnit);
          case 'actions':
            return _buildActionsCell(cell.value as InventoryItem);
          default: // 'name'
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(cell.value.toString()),
            );
        }
      }).toList(),
    );
  }

  Widget _buildImageCell(InventoryItem item) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child:
                (item.imagePath != null && File(item.imagePath!).existsSync())
                ? Image.file(File(item.imagePath!), fit: BoxFit.cover)
                : Container(
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.inventory_2_outlined,
                      color: Colors.grey,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityCell(int quantity) {
    Color color = _getQuantityColor(quantity);
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 8),
          Text(quantity.toString()),
        ],
      ),
    );
  }

  Widget _buildPriceCell(double price, CurrencyUnit unit) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(price.formatAsCurrency(unit)),
    );
  }

  Widget _buildActionsCell(InventoryItem item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () => onEdit(item),
        ),
        IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => onDelete(item),
        ),
      ],
    );
  }

  Color _getQuantityColor(int quantity) {
    if (quantity == 0) return Colors.red;
    if (quantity <= 5) return Colors.orange;
    return Colors.green;
  }
}
