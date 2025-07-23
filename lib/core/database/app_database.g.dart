// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $InventoryItemsTable extends InventoryItems
    with TableInfo<$InventoryItemsTable, InventoryItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purchasePriceMeta = const VerificationMeta(
    'purchasePrice',
  );
  @override
  late final GeneratedColumn<double> purchasePrice = GeneratedColumn<double>(
    'purchase_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _salePriceMeta = const VerificationMeta(
    'salePrice',
  );
  @override
  late final GeneratedColumn<double> salePrice = GeneratedColumn<double>(
    'sale_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    quantity,
    purchasePrice,
    salePrice,
    imagePath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<InventoryItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
        _purchasePriceMeta,
        purchasePrice.isAcceptableOrUnknown(
          data['purchase_price']!,
          _purchasePriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchasePriceMeta);
    }
    if (data.containsKey('sale_price')) {
      context.handle(
        _salePriceMeta,
        salePrice.isAcceptableOrUnknown(data['sale_price']!, _salePriceMeta),
      );
    } else if (isInserting) {
      context.missing(_salePriceMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryItemData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      purchasePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}purchase_price'],
      )!,
      salePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sale_price'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      ),
    );
  }

  @override
  $InventoryItemsTable createAlias(String alias) {
    return $InventoryItemsTable(attachedDatabase, alias);
  }
}

class InventoryItemData extends DataClass
    implements Insertable<InventoryItemData> {
  final int id;
  final String name;
  final int quantity;
  final double purchasePrice;
  final double salePrice;
  final String? imagePath;
  const InventoryItemData({
    required this.id,
    required this.name,
    required this.quantity,
    required this.purchasePrice,
    required this.salePrice,
    this.imagePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['quantity'] = Variable<int>(quantity);
    map['purchase_price'] = Variable<double>(purchasePrice);
    map['sale_price'] = Variable<double>(salePrice);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    return map;
  }

  InventoryItemsCompanion toCompanion(bool nullToAbsent) {
    return InventoryItemsCompanion(
      id: Value(id),
      name: Value(name),
      quantity: Value(quantity),
      purchasePrice: Value(purchasePrice),
      salePrice: Value(salePrice),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
    );
  }

  factory InventoryItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryItemData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<int>(json['quantity']),
      purchasePrice: serializer.fromJson<double>(json['purchasePrice']),
      salePrice: serializer.fromJson<double>(json['salePrice']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<int>(quantity),
      'purchasePrice': serializer.toJson<double>(purchasePrice),
      'salePrice': serializer.toJson<double>(salePrice),
      'imagePath': serializer.toJson<String?>(imagePath),
    };
  }

  InventoryItemData copyWith({
    int? id,
    String? name,
    int? quantity,
    double? purchasePrice,
    double? salePrice,
    Value<String?> imagePath = const Value.absent(),
  }) => InventoryItemData(
    id: id ?? this.id,
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    purchasePrice: purchasePrice ?? this.purchasePrice,
    salePrice: salePrice ?? this.salePrice,
    imagePath: imagePath.present ? imagePath.value : this.imagePath,
  );
  InventoryItemData copyWithCompanion(InventoryItemsCompanion data) {
    return InventoryItemData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItemData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('salePrice: $salePrice, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, quantity, purchasePrice, salePrice, imagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryItemData &&
          other.id == this.id &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.purchasePrice == this.purchasePrice &&
          other.salePrice == this.salePrice &&
          other.imagePath == this.imagePath);
}

class InventoryItemsCompanion extends UpdateCompanion<InventoryItemData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> quantity;
  final Value<double> purchasePrice;
  final Value<double> salePrice;
  final Value<String?> imagePath;
  const InventoryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  InventoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int quantity,
    required double purchasePrice,
    required double salePrice,
    this.imagePath = const Value.absent(),
  }) : name = Value(name),
       quantity = Value(quantity),
       purchasePrice = Value(purchasePrice),
       salePrice = Value(salePrice);
  static Insertable<InventoryItemData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? quantity,
    Expression<double>? purchasePrice,
    Expression<double>? salePrice,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (salePrice != null) 'sale_price': salePrice,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  InventoryItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? quantity,
    Value<double>? purchasePrice,
    Value<double>? salePrice,
    Value<String?>? imagePath,
  }) {
    return InventoryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      salePrice: salePrice ?? this.salePrice,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<double>(purchasePrice.value);
    }
    if (salePrice.present) {
      map['sale_price'] = Variable<double>(salePrice.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('salePrice: $salePrice, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTable extends Invoices
    with TableInfo<$InvoicesTable, InvoiceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerNameMeta = const VerificationMeta(
    'customerName',
  );
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
    'customer_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalPriceMeta = const VerificationMeta(
    'totalPrice',
  );
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
    'total_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, customerName, totalPrice];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('customer_name')) {
      context.handle(
        _customerNameMeta,
        customerName.isAcceptableOrUnknown(
          data['customer_name']!,
          _customerNameMeta,
        ),
      );
    }
    if (data.containsKey('total_price')) {
      context.handle(
        _totalPriceMeta,
        totalPrice.isAcceptableOrUnknown(data['total_price']!, _totalPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      customerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}customer_name'],
      ),
      totalPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_price'],
      )!,
    );
  }

  @override
  $InvoicesTable createAlias(String alias) {
    return $InvoicesTable(attachedDatabase, alias);
  }
}

class InvoiceData extends DataClass implements Insertable<InvoiceData> {
  final int id;
  final DateTime date;
  final String? customerName;
  final double totalPrice;
  const InvoiceData({
    required this.id,
    required this.date,
    this.customerName,
    required this.totalPrice,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || customerName != null) {
      map['customer_name'] = Variable<String>(customerName);
    }
    map['total_price'] = Variable<double>(totalPrice);
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      id: Value(id),
      date: Value(date),
      customerName: customerName == null && nullToAbsent
          ? const Value.absent()
          : Value(customerName),
      totalPrice: Value(totalPrice),
    );
  }

  factory InvoiceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      customerName: serializer.fromJson<String?>(json['customerName']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'customerName': serializer.toJson<String?>(customerName),
      'totalPrice': serializer.toJson<double>(totalPrice),
    };
  }

  InvoiceData copyWith({
    int? id,
    DateTime? date,
    Value<String?> customerName = const Value.absent(),
    double? totalPrice,
  }) => InvoiceData(
    id: id ?? this.id,
    date: date ?? this.date,
    customerName: customerName.present ? customerName.value : this.customerName,
    totalPrice: totalPrice ?? this.totalPrice,
  );
  InvoiceData copyWithCompanion(InvoicesCompanion data) {
    return InvoiceData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      totalPrice: data.totalPrice.present
          ? data.totalPrice.value
          : this.totalPrice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('customerName: $customerName, ')
          ..write('totalPrice: $totalPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, customerName, totalPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceData &&
          other.id == this.id &&
          other.date == this.date &&
          other.customerName == this.customerName &&
          other.totalPrice == this.totalPrice);
}

class InvoicesCompanion extends UpdateCompanion<InvoiceData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String?> customerName;
  final Value<double> totalPrice;
  const InvoicesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.customerName = const Value.absent(),
    this.totalPrice = const Value.absent(),
  });
  InvoicesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.customerName = const Value.absent(),
    required double totalPrice,
  }) : date = Value(date),
       totalPrice = Value(totalPrice);
  static Insertable<InvoiceData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? customerName,
    Expression<double>? totalPrice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (customerName != null) 'customer_name': customerName,
      if (totalPrice != null) 'total_price': totalPrice,
    });
  }

  InvoicesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<String?>? customerName,
    Value<double>? totalPrice,
  }) {
    return InvoicesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      customerName: customerName ?? this.customerName,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('customerName: $customerName, ')
          ..write('totalPrice: $totalPrice')
          ..write(')'))
        .toString();
  }
}

class $SaleItemsTable extends SaleItems
    with TableInfo<$SaleItemsTable, SaleItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES invoices (id)',
    ),
  );
  static const VerificationMeta _inventoryItemIdMeta = const VerificationMeta(
    'inventoryItemId',
  );
  @override
  late final GeneratedColumn<int> inventoryItemId = GeneratedColumn<int>(
    'inventory_item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES inventory_items (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    inventoryItemId,
    name,
    quantity,
    price,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sale_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<SaleItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('inventory_item_id')) {
      context.handle(
        _inventoryItemIdMeta,
        inventoryItemId.isAcceptableOrUnknown(
          data['inventory_item_id']!,
          _inventoryItemIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inventoryItemIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SaleItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleItemData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_id'],
      )!,
      inventoryItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}inventory_item_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
    );
  }

  @override
  $SaleItemsTable createAlias(String alias) {
    return $SaleItemsTable(attachedDatabase, alias);
  }
}

class SaleItemData extends DataClass implements Insertable<SaleItemData> {
  final int id;
  final int invoiceId;
  final int inventoryItemId;
  final String name;
  final int quantity;
  final double price;
  const SaleItemData({
    required this.id,
    required this.invoiceId,
    required this.inventoryItemId,
    required this.name,
    required this.quantity,
    required this.price,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_id'] = Variable<int>(invoiceId);
    map['inventory_item_id'] = Variable<int>(inventoryItemId);
    map['name'] = Variable<String>(name);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<double>(price);
    return map;
  }

  SaleItemsCompanion toCompanion(bool nullToAbsent) {
    return SaleItemsCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      inventoryItemId: Value(inventoryItemId),
      name: Value(name),
      quantity: Value(quantity),
      price: Value(price),
    );
  }

  factory SaleItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleItemData(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      inventoryItemId: serializer.fromJson<int>(json['inventoryItemId']),
      name: serializer.fromJson<String>(json['name']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'inventoryItemId': serializer.toJson<int>(inventoryItemId),
      'name': serializer.toJson<String>(name),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<double>(price),
    };
  }

  SaleItemData copyWith({
    int? id,
    int? invoiceId,
    int? inventoryItemId,
    String? name,
    int? quantity,
    double? price,
  }) => SaleItemData(
    id: id ?? this.id,
    invoiceId: invoiceId ?? this.invoiceId,
    inventoryItemId: inventoryItemId ?? this.inventoryItemId,
    name: name ?? this.name,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
  );
  SaleItemData copyWithCompanion(SaleItemsCompanion data) {
    return SaleItemData(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      inventoryItemId: data.inventoryItemId.present
          ? data.inventoryItemId.value
          : this.inventoryItemId,
      name: data.name.present ? data.name.value : this.name,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleItemData(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('inventoryItemId: $inventoryItemId, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, invoiceId, inventoryItemId, name, quantity, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleItemData &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.inventoryItemId == this.inventoryItemId &&
          other.name == this.name &&
          other.quantity == this.quantity &&
          other.price == this.price);
}

class SaleItemsCompanion extends UpdateCompanion<SaleItemData> {
  final Value<int> id;
  final Value<int> invoiceId;
  final Value<int> inventoryItemId;
  final Value<String> name;
  final Value<int> quantity;
  final Value<double> price;
  const SaleItemsCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.inventoryItemId = const Value.absent(),
    this.name = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
  });
  SaleItemsCompanion.insert({
    this.id = const Value.absent(),
    required int invoiceId,
    required int inventoryItemId,
    required String name,
    required int quantity,
    required double price,
  }) : invoiceId = Value(invoiceId),
       inventoryItemId = Value(inventoryItemId),
       name = Value(name),
       quantity = Value(quantity),
       price = Value(price);
  static Insertable<SaleItemData> custom({
    Expression<int>? id,
    Expression<int>? invoiceId,
    Expression<int>? inventoryItemId,
    Expression<String>? name,
    Expression<int>? quantity,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (inventoryItemId != null) 'inventory_item_id': inventoryItemId,
      if (name != null) 'name': name,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
    });
  }

  SaleItemsCompanion copyWith({
    Value<int>? id,
    Value<int>? invoiceId,
    Value<int>? inventoryItemId,
    Value<String>? name,
    Value<int>? quantity,
    Value<double>? price,
  }) {
    return SaleItemsCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      inventoryItemId: inventoryItemId ?? this.inventoryItemId,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (inventoryItemId.present) {
      map['inventory_item_id'] = Variable<int>(inventoryItemId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleItemsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('inventoryItemId: $inventoryItemId, ')
          ..write('name: $name, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $InventoryItemsTable inventoryItems = $InventoryItemsTable(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final $SaleItemsTable saleItems = $SaleItemsTable(this);
  late final InventoryDao inventoryDao = InventoryDao(this as AppDatabase);
  late final SalesDao salesDao = SalesDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    inventoryItems,
    invoices,
    saleItems,
  ];
}

typedef $$InventoryItemsTableCreateCompanionBuilder =
    InventoryItemsCompanion Function({
      Value<int> id,
      required String name,
      required int quantity,
      required double purchasePrice,
      required double salePrice,
      Value<String?> imagePath,
    });
typedef $$InventoryItemsTableUpdateCompanionBuilder =
    InventoryItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> quantity,
      Value<double> purchasePrice,
      Value<double> salePrice,
      Value<String?> imagePath,
    });

final class $$InventoryItemsTableReferences
    extends
        BaseReferences<_$AppDatabase, $InventoryItemsTable, InventoryItemData> {
  $$InventoryItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$SaleItemsTable, List<SaleItemData>>
  _saleItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.saleItems,
    aliasName: $_aliasNameGenerator(
      db.inventoryItems.id,
      db.saleItems.inventoryItemId,
    ),
  );

  $$SaleItemsTableProcessedTableManager get saleItemsRefs {
    final manager = $$SaleItemsTableTableManager(
      $_db,
      $_db.saleItems,
    ).filter((f) => f.inventoryItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_saleItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InventoryItemsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> saleItemsRefs(
    Expression<bool> Function($$SaleItemsTableFilterComposer f) f,
  ) {
    final $$SaleItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleItems,
      getReferencedColumn: (t) => t.inventoryItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleItemsTableFilterComposer(
            $db: $db,
            $table: $db.saleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InventoryItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get salePrice => $composableBuilder(
    column: $table.salePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InventoryItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryItemsTable> {
  $$InventoryItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  Expression<T> saleItemsRefs<T extends Object>(
    Expression<T> Function($$SaleItemsTableAnnotationComposer a) f,
  ) {
    final $$SaleItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleItems,
      getReferencedColumn: (t) => t.inventoryItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.saleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InventoryItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventoryItemsTable,
          InventoryItemData,
          $$InventoryItemsTableFilterComposer,
          $$InventoryItemsTableOrderingComposer,
          $$InventoryItemsTableAnnotationComposer,
          $$InventoryItemsTableCreateCompanionBuilder,
          $$InventoryItemsTableUpdateCompanionBuilder,
          (InventoryItemData, $$InventoryItemsTableReferences),
          InventoryItemData,
          PrefetchHooks Function({bool saleItemsRefs})
        > {
  $$InventoryItemsTableTableManager(
    _$AppDatabase db,
    $InventoryItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<double> purchasePrice = const Value.absent(),
                Value<double> salePrice = const Value.absent(),
                Value<String?> imagePath = const Value.absent(),
              }) => InventoryItemsCompanion(
                id: id,
                name: name,
                quantity: quantity,
                purchasePrice: purchasePrice,
                salePrice: salePrice,
                imagePath: imagePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int quantity,
                required double purchasePrice,
                required double salePrice,
                Value<String?> imagePath = const Value.absent(),
              }) => InventoryItemsCompanion.insert(
                id: id,
                name: name,
                quantity: quantity,
                purchasePrice: purchasePrice,
                salePrice: salePrice,
                imagePath: imagePath,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InventoryItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({saleItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (saleItemsRefs) db.saleItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (saleItemsRefs)
                    await $_getPrefetchedData<
                      InventoryItemData,
                      $InventoryItemsTable,
                      SaleItemData
                    >(
                      currentTable: table,
                      referencedTable: $$InventoryItemsTableReferences
                          ._saleItemsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$InventoryItemsTableReferences(
                            db,
                            table,
                            p0,
                          ).saleItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.inventoryItemId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$InventoryItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventoryItemsTable,
      InventoryItemData,
      $$InventoryItemsTableFilterComposer,
      $$InventoryItemsTableOrderingComposer,
      $$InventoryItemsTableAnnotationComposer,
      $$InventoryItemsTableCreateCompanionBuilder,
      $$InventoryItemsTableUpdateCompanionBuilder,
      (InventoryItemData, $$InventoryItemsTableReferences),
      InventoryItemData,
      PrefetchHooks Function({bool saleItemsRefs})
    >;
typedef $$InvoicesTableCreateCompanionBuilder =
    InvoicesCompanion Function({
      Value<int> id,
      required DateTime date,
      Value<String?> customerName,
      required double totalPrice,
    });
typedef $$InvoicesTableUpdateCompanionBuilder =
    InvoicesCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<String?> customerName,
      Value<double> totalPrice,
    });

final class $$InvoicesTableReferences
    extends BaseReferences<_$AppDatabase, $InvoicesTable, InvoiceData> {
  $$InvoicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SaleItemsTable, List<SaleItemData>>
  _saleItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.saleItems,
    aliasName: $_aliasNameGenerator(db.invoices.id, db.saleItems.invoiceId),
  );

  $$SaleItemsTableProcessedTableManager get saleItemsRefs {
    final manager = $$SaleItemsTableTableManager(
      $_db,
      $_db.saleItems,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_saleItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> saleItemsRefs(
    Expression<bool> Function($$SaleItemsTableFilterComposer f) f,
  ) {
    final $$SaleItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleItems,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleItemsTableFilterComposer(
            $db: $db,
            $table: $db.saleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
    column: $table.customerName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => column,
  );

  Expression<T> saleItemsRefs<T extends Object>(
    Expression<T> Function($$SaleItemsTableAnnotationComposer a) f,
  ) {
    final $$SaleItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleItems,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.saleItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoicesTable,
          InvoiceData,
          $$InvoicesTableFilterComposer,
          $$InvoicesTableOrderingComposer,
          $$InvoicesTableAnnotationComposer,
          $$InvoicesTableCreateCompanionBuilder,
          $$InvoicesTableUpdateCompanionBuilder,
          (InvoiceData, $$InvoicesTableReferences),
          InvoiceData,
          PrefetchHooks Function({bool saleItemsRefs})
        > {
  $$InvoicesTableTableManager(_$AppDatabase db, $InvoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String?> customerName = const Value.absent(),
                Value<double> totalPrice = const Value.absent(),
              }) => InvoicesCompanion(
                id: id,
                date: date,
                customerName: customerName,
                totalPrice: totalPrice,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                Value<String?> customerName = const Value.absent(),
                required double totalPrice,
              }) => InvoicesCompanion.insert(
                id: id,
                date: date,
                customerName: customerName,
                totalPrice: totalPrice,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({saleItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (saleItemsRefs) db.saleItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (saleItemsRefs)
                    await $_getPrefetchedData<
                      InvoiceData,
                      $InvoicesTable,
                      SaleItemData
                    >(
                      currentTable: table,
                      referencedTable: $$InvoicesTableReferences
                          ._saleItemsRefsTable(db),
                      managerFromTypedResult: (p0) => $$InvoicesTableReferences(
                        db,
                        table,
                        p0,
                      ).saleItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.invoiceId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$InvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoicesTable,
      InvoiceData,
      $$InvoicesTableFilterComposer,
      $$InvoicesTableOrderingComposer,
      $$InvoicesTableAnnotationComposer,
      $$InvoicesTableCreateCompanionBuilder,
      $$InvoicesTableUpdateCompanionBuilder,
      (InvoiceData, $$InvoicesTableReferences),
      InvoiceData,
      PrefetchHooks Function({bool saleItemsRefs})
    >;
typedef $$SaleItemsTableCreateCompanionBuilder =
    SaleItemsCompanion Function({
      Value<int> id,
      required int invoiceId,
      required int inventoryItemId,
      required String name,
      required int quantity,
      required double price,
    });
typedef $$SaleItemsTableUpdateCompanionBuilder =
    SaleItemsCompanion Function({
      Value<int> id,
      Value<int> invoiceId,
      Value<int> inventoryItemId,
      Value<String> name,
      Value<int> quantity,
      Value<double> price,
    });

final class $$SaleItemsTableReferences
    extends BaseReferences<_$AppDatabase, $SaleItemsTable, SaleItemData> {
  $$SaleItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InvoicesTable _invoiceIdTable(_$AppDatabase db) =>
      db.invoices.createAlias(
        $_aliasNameGenerator(db.saleItems.invoiceId, db.invoices.id),
      );

  $$InvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<int>('invoice_id')!;

    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InventoryItemsTable _inventoryItemIdTable(_$AppDatabase db) =>
      db.inventoryItems.createAlias(
        $_aliasNameGenerator(
          db.saleItems.inventoryItemId,
          db.inventoryItems.id,
        ),
      );

  $$InventoryItemsTableProcessedTableManager get inventoryItemId {
    final $_column = $_itemColumn<int>('inventory_item_id')!;

    final manager = $$InventoryItemsTableTableManager(
      $_db,
      $_db.inventoryItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_inventoryItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SaleItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  $$InvoicesTableFilterComposer get invoiceId {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InventoryItemsTableFilterComposer get inventoryItemId {
    final $$InventoryItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inventoryItemId,
      referencedTable: $db.inventoryItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InventoryItemsTableFilterComposer(
            $db: $db,
            $table: $db.inventoryItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SaleItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  $$InvoicesTableOrderingComposer get invoiceId {
    final $$InvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InventoryItemsTableOrderingComposer get inventoryItemId {
    final $$InventoryItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inventoryItemId,
      referencedTable: $db.inventoryItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InventoryItemsTableOrderingComposer(
            $db: $db,
            $table: $db.inventoryItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SaleItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SaleItemsTable> {
  $$SaleItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  $$InvoicesTableAnnotationComposer get invoiceId {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InventoryItemsTableAnnotationComposer get inventoryItemId {
    final $$InventoryItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inventoryItemId,
      referencedTable: $db.inventoryItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InventoryItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.inventoryItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SaleItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SaleItemsTable,
          SaleItemData,
          $$SaleItemsTableFilterComposer,
          $$SaleItemsTableOrderingComposer,
          $$SaleItemsTableAnnotationComposer,
          $$SaleItemsTableCreateCompanionBuilder,
          $$SaleItemsTableUpdateCompanionBuilder,
          (SaleItemData, $$SaleItemsTableReferences),
          SaleItemData,
          PrefetchHooks Function({bool invoiceId, bool inventoryItemId})
        > {
  $$SaleItemsTableTableManager(_$AppDatabase db, $SaleItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SaleItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SaleItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SaleItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> invoiceId = const Value.absent(),
                Value<int> inventoryItemId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<double> price = const Value.absent(),
              }) => SaleItemsCompanion(
                id: id,
                invoiceId: invoiceId,
                inventoryItemId: inventoryItemId,
                name: name,
                quantity: quantity,
                price: price,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int invoiceId,
                required int inventoryItemId,
                required String name,
                required int quantity,
                required double price,
              }) => SaleItemsCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                inventoryItemId: inventoryItemId,
                name: name,
                quantity: quantity,
                price: price,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SaleItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({invoiceId = false, inventoryItemId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (invoiceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.invoiceId,
                                    referencedTable: $$SaleItemsTableReferences
                                        ._invoiceIdTable(db),
                                    referencedColumn: $$SaleItemsTableReferences
                                        ._invoiceIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (inventoryItemId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.inventoryItemId,
                                    referencedTable: $$SaleItemsTableReferences
                                        ._inventoryItemIdTable(db),
                                    referencedColumn: $$SaleItemsTableReferences
                                        ._inventoryItemIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$SaleItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SaleItemsTable,
      SaleItemData,
      $$SaleItemsTableFilterComposer,
      $$SaleItemsTableOrderingComposer,
      $$SaleItemsTableAnnotationComposer,
      $$SaleItemsTableCreateCompanionBuilder,
      $$SaleItemsTableUpdateCompanionBuilder,
      (SaleItemData, $$SaleItemsTableReferences),
      SaleItemData,
      PrefetchHooks Function({bool invoiceId, bool inventoryItemId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$InventoryItemsTableTableManager get inventoryItems =>
      $$InventoryItemsTableTableManager(_db, _db.inventoryItems);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
  $$SaleItemsTableTableManager get saleItems =>
      $$SaleItemsTableTableManager(_db, _db.saleItems);
}
