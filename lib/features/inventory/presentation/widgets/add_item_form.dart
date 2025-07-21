import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
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

  String? _selectedImagePath;

  @override
  void initState() {
    super.initState();
    if (widget.editingItem != null) {
      final item = widget.editingItem!;
      _nameController.text = item.name;
      _quantityController.text = item.quantity.toString();
      _purchasePriceController.text = item.purchasePrice.toString();
      _salePriceController.text = item.salePrice.toString();
      _selectedImagePath = widget.editingItem!.imagePath;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _purchasePriceController.dispose();
    _salePriceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = p.basename(pickedFile.path);
      final savedImage = await File(
        pickedFile.path,
      ).copy('${appDir.path}/$fileName');

      setState(() {
        _selectedImagePath = savedImage.path;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final isEditing = widget.editingItem != null;

      final itemToSave = InventoryItem(
        id: widget.editingItem?.id ?? 0,
        name: _nameController.text,
        quantity: double.parse(_quantityController.text),
        purchasePrice: double.parse(_purchasePriceController.text),
        salePrice: double.parse(_salePriceController.text),
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
    final isEditing = widget.editingItem != null;
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 20,
        // این مقدار باعث می‌شود کیبورد روی فرم را نپوشاند
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
                isEditing ? 'ویرایش کالا' : 'افزودن کالای جدید',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'نام کالا'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'لطفاً نام کالا را وارد کنید';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: 'تعداد'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'لطفاً یک عدد معتبر وارد کنید';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _purchasePriceController,
                decoration: const InputDecoration(labelText: 'قیمت خرید'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'لطفاً یک قیمت معتبر وارد کنید';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _salePriceController,
                decoration: const InputDecoration(labelText: 'قیمت فروش'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'لطفاً یک قیمت معتبر وارد کنید';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // بخش انتخاب و پیش‌نمایش عکس
              _buildImagePicker(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  widget.editingItem != null ? 'ذخیره تغییرات' : 'ذخیره',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
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
          onPressed: _pickImage,
          icon: const Icon(Icons.camera_alt),
          label: const Text('انتخاب عکس'),
        ),
      ],
    );
  }
}
