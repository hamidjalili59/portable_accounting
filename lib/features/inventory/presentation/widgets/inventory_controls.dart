import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/inventory_bloc.dart';

/// A widget that provides UI controls for searching and sorting the inventory list.
///
/// It includes a debounced search field to improve performance by waiting for
/// the user to stop typing before dispatching a search event.
class InventoryControls extends StatefulWidget {
  final String searchQuery;
  final InventorySortOrder sortOrder;

  const InventoryControls({
    super.key,
    required this.searchQuery,
    required this.sortOrder,
  });

  @override
  State<InventoryControls> createState() => _InventoryControlsState();
}

class _InventoryControlsState extends State<InventoryControls> {
  late final TextEditingController _searchController;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.searchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  /// Debounces the search input to avoid excessive event firing.
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        context.read<InventoryBloc>().add(InventoryEvent.searchChanged(query));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // Search Text Field
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          const SizedBox(width: 16),
          // Sorting Dropdown Menu
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<InventorySortOrder>(
                value: widget.sortOrder,
                items: const [
                  DropdownMenuItem(
                    value: InventorySortOrder.byNameAsc,
                    child: Text('Name (A-Z)'),
                  ),
                  DropdownMenuItem(
                    value: InventorySortOrder.byNameDesc,
                    child: Text('Name (Z-A)'),
                  ),
                  DropdownMenuItem(
                    value: InventorySortOrder.byQuantityAsc,
                    child: Text('Quantity (Low-High)'),
                  ),
                  DropdownMenuItem(
                    value: InventorySortOrder.byQuantityDesc,
                    child: Text('Quantity (High-Low)'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    context.read<InventoryBloc>().add(
                      InventoryEvent.sortOrderChanged(value),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
