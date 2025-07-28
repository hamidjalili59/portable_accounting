import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:portable_accounting/core/helpers/thousands_separator_input_formatter.dart';
import 'package:portable_accounting/core/l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:portable_accounting/core/l10n/l10n.dart';
import 'package:portable_accounting/core/router/app_router.dart';
import 'package:portable_accounting/features/inventory/domain/entities/inventory_item.dart';
import 'package:portable_accounting/features/inventory/presentation/bloc/inventory_bloc.dart';

class AddItemForm extends StatefulWidget {
  final InventoryItem? editingItem;

  const AddItemForm({super.key, this.editingItem});

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _purchasePriceController = TextEditingController();
  final _salePriceController = TextEditingController();
  final _markupPercentController = TextEditingController();
  bool _isManualSalePrice = false;

  String? _selectedImagePath;

  bool _isFormDirty = false;

  @override
  void initState() {
    super.initState();
    _purchasePriceController.addListener(_calculateSalePrice);
    _markupPercentController.addListener(_calculateSalePrice);
    if (widget.editingItem != null) {
      final item = widget.editingItem!;
      _nameController.text = item.name;
      _quantityController.text = item.quantity.toString();
      _purchasePriceController.text = item.purchasePrice.toString();
      _salePriceController.text = item.salePrice.toString();
      _selectedImagePath = widget.editingItem!.imagePath;

      _nameController.addListener(_onFormChanged);
      _quantityController.addListener(_onFormChanged);
      _purchasePriceController.addListener(_onFormChanged);
      _salePriceController.addListener(_onFormChanged);
    }
  }

  void _onFormChanged() {
    if (!_isFormDirty) {
      setState(() {
        _isFormDirty = true;
      });
    }
  }

  @override
  void dispose() {
    _purchasePriceController.removeListener(_calculateSalePrice);
    _markupPercentController.removeListener(_calculateSalePrice);
    _markupPercentController.dispose();
    _nameController.removeListener(_onFormChanged);
    _quantityController.removeListener(_onFormChanged);
    _purchasePriceController.removeListener(_onFormChanged);
    _salePriceController.removeListener(_onFormChanged);
    _nameController.dispose();
    _quantityController.dispose();
    _purchasePriceController.dispose();
    _salePriceController.dispose();

    super.dispose();
  }

  void _calculateSalePrice() {
    if (_isManualSalePrice) return;

    final purchasePrice =
        double.tryParse(_purchasePriceController.text.replaceAll(',', '')) ?? 0;
    final markup = double.tryParse(_markupPercentController.text) ?? 0;

    if (purchasePrice > 0) {
      final salePrice = purchasePrice * (1 + (markup / 100));
      final formatter = NumberFormat('#,###');
      _salePriceController.text = formatter.format(salePrice.round());
    } else {
      _salePriceController.text = '0';
    }
    _onFormChanged();
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 80);

    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = p.basename(pickedFile.path);
      final savedImage = await File(
        pickedFile.path,
      ).copy('${appDir.path}/$fileName');

      setState(() {
        _selectedImagePath = savedImage.path;
        _onFormChanged(); // Mark form as dirty
      });
    }
  }

  Widget _buildSourceOption({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest.withAlpha((0.5 * 255).toInt()),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    final l10n = context.l10n;
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                l10n.form_imageSourceTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSourceOption(
                    context: context,
                    icon: Icons.photo_library_outlined,
                    label: l10n.form_gallery,
                    onTap: () {
                      _pickImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildSourceOption(
                    context: context,
                    icon: Icons.camera_alt_outlined,
                    label: l10n.form_camera,
                    onTap: () {
                      _pickImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final purchasePrice = double.parse(
        _purchasePriceController.text.replaceAll(',', ''),
      );
      final salePrice = double.parse(
        _salePriceController.text.replaceAll(',', ''),
      );

      final isEditing = widget.editingItem != null;

      final itemToSave = InventoryItem(
        id: widget.editingItem?.id ?? 0,
        name: _nameController.text,
        quantity: int.parse(_quantityController.text),
        purchasePrice: purchasePrice,
        salePrice: salePrice,
        imagePath: _selectedImagePath,
      );

      if (isEditing) {
        context.read<InventoryBloc>().add(
          InventoryEvent.updateItem(itemToSave),
        );
      } else {
        context.read<InventoryBloc>().add(InventoryEvent.addItem(itemToSave));
      }

      if (mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isEditing = widget.editingItem != null;
    return PopScope(
      canPop: !_isFormDirty,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(l10n.dialog_discardChangesTitle),
            content: Text(l10n.dialog_discardChangesMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(l10n.global_stay),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(l10n.global_discard),
              ),
            ],
          ),
        );

        if (shouldPop ?? false) {
          if (mounted) {
            router.pop();
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  isEditing
                      ? l10n.form_editItemTitle
                      : l10n.form_addNewItemTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: l10n.inventory_item_name,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return l10n.form_validator_pleaseEnterName;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _quantityController,
                  decoration: InputDecoration(
                    labelText: l10n.inventory_quantity,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null ||
                        double.tryParse(value.replaceAll(',', '')) == null) {
                      return l10n.form_validator_pleaseEnterValidNumber;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _purchasePriceController,
                  decoration: InputDecoration(
                    labelText: l10n.inventory_purchase_price_field,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [ThousandsSeparatorInputFormatter()],
                  validator: (value) {
                    if (value == null ||
                        double.tryParse(value.replaceAll(',', '')) == null) {
                      return l10n.form_validator_pleaseEnterValidNumber;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // --- بخش جدید و هوشمند قیمت فروش ---
                Row(
                  children: [
                    Text(
                      'قیمت فروش دستی',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                    Switch(
                      value: _isManualSalePrice,
                      onChanged: (value) {
                        setState(() {
                          _isManualSalePrice = value;
                          if (!value) {
                            // اگر حالت دستی غیرفعال شد، قیمت را دوباره محاسبه کن
                            _calculateSalePrice();
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // نمایش فیلد مناسب بر اساس حالت
                if (_isManualSalePrice)
                  TextFormField(
                    controller: _salePriceController,
                    decoration: InputDecoration(
                      labelText: l10n.inventory_sale_price_field,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [ThousandsSeparatorInputFormatter()],
                    validator: (value) {
                      if (value == null ||
                          double.tryParse(value.replaceAll(',', '')) == null) {
                        return 'لطفاً یک قیمت معتبر وارد کنید';
                      }
                      return null;
                    },
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _markupPercentController,
                          decoration: const InputDecoration(
                            labelText: 'درصد سود',
                            suffixText: '%',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _salePriceController,
                          decoration: InputDecoration(
                            labelText: l10n.inventory_sale_price_field,
                            filled: true,
                            fillColor: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest
                                .withAlpha((0.5 * 255).toInt()),
                          ),
                          readOnly: true, // این فیلد فقط نمایش‌دهنده است
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 20),
                // بخش انتخاب و پیش‌نمایش عکس
                _buildImagePicker(l10n),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _submitForm,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text(
                      isEditing ? l10n.form_saveChanges : l10n.global_save,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker(AppLocalizations l10n) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: _selectedImagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(_selectedImagePath!),
                    fit: BoxFit.cover,
                  ),
                )
              : const Icon(Icons.image, size: 50, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: () => _showImageSourceDialog(context),
          icon: const Icon(Icons.camera_alt),
          label: Text(l10n.form_imageSourceTitle),
        ),
      ],
    );
  }
}
