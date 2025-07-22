// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SalesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesEvent()';
}


}

/// @nodoc
class $SalesEventCopyWith<$Res>  {
$SalesEventCopyWith(SalesEvent _, $Res Function(SalesEvent) __);
}


/// Adds pattern-matching-related methods to [SalesEvent].
extension SalesEventPatterns on SalesEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadInitialData value)?  loadInitialData,TResult Function( AddItemToInvoice value)?  addItemToInvoice,TResult Function( UpdateItemQuantity value)?  updateItemQuantity,TResult Function( RemoveItemFromInvoice value)?  removeItemFromInvoice,TResult Function( SubmitInvoice value)?  submitInvoice,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadInitialData() when loadInitialData != null:
return loadInitialData(_that);case AddItemToInvoice() when addItemToInvoice != null:
return addItemToInvoice(_that);case UpdateItemQuantity() when updateItemQuantity != null:
return updateItemQuantity(_that);case RemoveItemFromInvoice() when removeItemFromInvoice != null:
return removeItemFromInvoice(_that);case SubmitInvoice() when submitInvoice != null:
return submitInvoice(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadInitialData value)  loadInitialData,required TResult Function( AddItemToInvoice value)  addItemToInvoice,required TResult Function( UpdateItemQuantity value)  updateItemQuantity,required TResult Function( RemoveItemFromInvoice value)  removeItemFromInvoice,required TResult Function( SubmitInvoice value)  submitInvoice,}){
final _that = this;
switch (_that) {
case LoadInitialData():
return loadInitialData(_that);case AddItemToInvoice():
return addItemToInvoice(_that);case UpdateItemQuantity():
return updateItemQuantity(_that);case RemoveItemFromInvoice():
return removeItemFromInvoice(_that);case SubmitInvoice():
return submitInvoice(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadInitialData value)?  loadInitialData,TResult? Function( AddItemToInvoice value)?  addItemToInvoice,TResult? Function( UpdateItemQuantity value)?  updateItemQuantity,TResult? Function( RemoveItemFromInvoice value)?  removeItemFromInvoice,TResult? Function( SubmitInvoice value)?  submitInvoice,}){
final _that = this;
switch (_that) {
case LoadInitialData() when loadInitialData != null:
return loadInitialData(_that);case AddItemToInvoice() when addItemToInvoice != null:
return addItemToInvoice(_that);case UpdateItemQuantity() when updateItemQuantity != null:
return updateItemQuantity(_that);case RemoveItemFromInvoice() when removeItemFromInvoice != null:
return removeItemFromInvoice(_that);case SubmitInvoice() when submitInvoice != null:
return submitInvoice(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadInitialData,TResult Function( InventoryItem item)?  addItemToInvoice,TResult Function( SaleItem item,  int newQuantity)?  updateItemQuantity,TResult Function( SaleItem item)?  removeItemFromInvoice,TResult Function( String? customerName)?  submitInvoice,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadInitialData() when loadInitialData != null:
return loadInitialData();case AddItemToInvoice() when addItemToInvoice != null:
return addItemToInvoice(_that.item);case UpdateItemQuantity() when updateItemQuantity != null:
return updateItemQuantity(_that.item,_that.newQuantity);case RemoveItemFromInvoice() when removeItemFromInvoice != null:
return removeItemFromInvoice(_that.item);case SubmitInvoice() when submitInvoice != null:
return submitInvoice(_that.customerName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadInitialData,required TResult Function( InventoryItem item)  addItemToInvoice,required TResult Function( SaleItem item,  int newQuantity)  updateItemQuantity,required TResult Function( SaleItem item)  removeItemFromInvoice,required TResult Function( String? customerName)  submitInvoice,}) {final _that = this;
switch (_that) {
case LoadInitialData():
return loadInitialData();case AddItemToInvoice():
return addItemToInvoice(_that.item);case UpdateItemQuantity():
return updateItemQuantity(_that.item,_that.newQuantity);case RemoveItemFromInvoice():
return removeItemFromInvoice(_that.item);case SubmitInvoice():
return submitInvoice(_that.customerName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadInitialData,TResult? Function( InventoryItem item)?  addItemToInvoice,TResult? Function( SaleItem item,  int newQuantity)?  updateItemQuantity,TResult? Function( SaleItem item)?  removeItemFromInvoice,TResult? Function( String? customerName)?  submitInvoice,}) {final _that = this;
switch (_that) {
case LoadInitialData() when loadInitialData != null:
return loadInitialData();case AddItemToInvoice() when addItemToInvoice != null:
return addItemToInvoice(_that.item);case UpdateItemQuantity() when updateItemQuantity != null:
return updateItemQuantity(_that.item,_that.newQuantity);case RemoveItemFromInvoice() when removeItemFromInvoice != null:
return removeItemFromInvoice(_that.item);case SubmitInvoice() when submitInvoice != null:
return submitInvoice(_that.customerName);case _:
  return null;

}
}

}

/// @nodoc


class LoadInitialData implements SalesEvent {
  const LoadInitialData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadInitialData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesEvent.loadInitialData()';
}


}




/// @nodoc


class AddItemToInvoice implements SalesEvent {
  const AddItemToInvoice(this.item);
  

 final  InventoryItem item;

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddItemToInvoiceCopyWith<AddItemToInvoice> get copyWith => _$AddItemToInvoiceCopyWithImpl<AddItemToInvoice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddItemToInvoice&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'SalesEvent.addItemToInvoice(item: $item)';
}


}

/// @nodoc
abstract mixin class $AddItemToInvoiceCopyWith<$Res> implements $SalesEventCopyWith<$Res> {
  factory $AddItemToInvoiceCopyWith(AddItemToInvoice value, $Res Function(AddItemToInvoice) _then) = _$AddItemToInvoiceCopyWithImpl;
@useResult
$Res call({
 InventoryItem item
});


$InventoryItemCopyWith<$Res> get item;

}
/// @nodoc
class _$AddItemToInvoiceCopyWithImpl<$Res>
    implements $AddItemToInvoiceCopyWith<$Res> {
  _$AddItemToInvoiceCopyWithImpl(this._self, this._then);

  final AddItemToInvoice _self;
  final $Res Function(AddItemToInvoice) _then;

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(AddItemToInvoice(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as InventoryItem,
  ));
}

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InventoryItemCopyWith<$Res> get item {
  
  return $InventoryItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class UpdateItemQuantity implements SalesEvent {
  const UpdateItemQuantity(this.item, this.newQuantity);
  

 final  SaleItem item;
 final  int newQuantity;

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateItemQuantityCopyWith<UpdateItemQuantity> get copyWith => _$UpdateItemQuantityCopyWithImpl<UpdateItemQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateItemQuantity&&(identical(other.item, item) || other.item == item)&&(identical(other.newQuantity, newQuantity) || other.newQuantity == newQuantity));
}


@override
int get hashCode => Object.hash(runtimeType,item,newQuantity);

@override
String toString() {
  return 'SalesEvent.updateItemQuantity(item: $item, newQuantity: $newQuantity)';
}


}

/// @nodoc
abstract mixin class $UpdateItemQuantityCopyWith<$Res> implements $SalesEventCopyWith<$Res> {
  factory $UpdateItemQuantityCopyWith(UpdateItemQuantity value, $Res Function(UpdateItemQuantity) _then) = _$UpdateItemQuantityCopyWithImpl;
@useResult
$Res call({
 SaleItem item, int newQuantity
});


$SaleItemCopyWith<$Res> get item;

}
/// @nodoc
class _$UpdateItemQuantityCopyWithImpl<$Res>
    implements $UpdateItemQuantityCopyWith<$Res> {
  _$UpdateItemQuantityCopyWithImpl(this._self, this._then);

  final UpdateItemQuantity _self;
  final $Res Function(UpdateItemQuantity) _then;

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,Object? newQuantity = null,}) {
  return _then(UpdateItemQuantity(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as SaleItem,null == newQuantity ? _self.newQuantity : newQuantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleItemCopyWith<$Res> get item {
  
  return $SaleItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class RemoveItemFromInvoice implements SalesEvent {
  const RemoveItemFromInvoice(this.item);
  

 final  SaleItem item;

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveItemFromInvoiceCopyWith<RemoveItemFromInvoice> get copyWith => _$RemoveItemFromInvoiceCopyWithImpl<RemoveItemFromInvoice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveItemFromInvoice&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'SalesEvent.removeItemFromInvoice(item: $item)';
}


}

/// @nodoc
abstract mixin class $RemoveItemFromInvoiceCopyWith<$Res> implements $SalesEventCopyWith<$Res> {
  factory $RemoveItemFromInvoiceCopyWith(RemoveItemFromInvoice value, $Res Function(RemoveItemFromInvoice) _then) = _$RemoveItemFromInvoiceCopyWithImpl;
@useResult
$Res call({
 SaleItem item
});


$SaleItemCopyWith<$Res> get item;

}
/// @nodoc
class _$RemoveItemFromInvoiceCopyWithImpl<$Res>
    implements $RemoveItemFromInvoiceCopyWith<$Res> {
  _$RemoveItemFromInvoiceCopyWithImpl(this._self, this._then);

  final RemoveItemFromInvoice _self;
  final $Res Function(RemoveItemFromInvoice) _then;

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(RemoveItemFromInvoice(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as SaleItem,
  ));
}

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SaleItemCopyWith<$Res> get item {
  
  return $SaleItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class SubmitInvoice implements SalesEvent {
  const SubmitInvoice({this.customerName});
  

 final  String? customerName;

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitInvoiceCopyWith<SubmitInvoice> get copyWith => _$SubmitInvoiceCopyWithImpl<SubmitInvoice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitInvoice&&(identical(other.customerName, customerName) || other.customerName == customerName));
}


@override
int get hashCode => Object.hash(runtimeType,customerName);

@override
String toString() {
  return 'SalesEvent.submitInvoice(customerName: $customerName)';
}


}

/// @nodoc
abstract mixin class $SubmitInvoiceCopyWith<$Res> implements $SalesEventCopyWith<$Res> {
  factory $SubmitInvoiceCopyWith(SubmitInvoice value, $Res Function(SubmitInvoice) _then) = _$SubmitInvoiceCopyWithImpl;
@useResult
$Res call({
 String? customerName
});




}
/// @nodoc
class _$SubmitInvoiceCopyWithImpl<$Res>
    implements $SubmitInvoiceCopyWith<$Res> {
  _$SubmitInvoiceCopyWithImpl(this._self, this._then);

  final SubmitInvoice _self;
  final $Res Function(SubmitInvoice) _then;

/// Create a copy of SalesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? customerName = freezed,}) {
  return _then(SubmitInvoice(
customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$SalesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesState()';
}


}

/// @nodoc
class $SalesStateCopyWith<$Res>  {
$SalesStateCopyWith(SalesState _, $Res Function(SalesState) __);
}


/// Adds pattern-matching-related methods to [SalesState].
extension SalesStatePatterns on SalesState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<InventoryItem> availableItems,  List<SaleItem> invoiceItems,  double totalPrice)?  loaded,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.availableItems,_that.invoiceItems,_that.totalPrice);case _Success() when success != null:
return success();case _Error() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<InventoryItem> availableItems,  List<SaleItem> invoiceItems,  double totalPrice)  loaded,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.availableItems,_that.invoiceItems,_that.totalPrice);case _Success():
return success();case _Error():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<InventoryItem> availableItems,  List<SaleItem> invoiceItems,  double totalPrice)?  loaded,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.availableItems,_that.invoiceItems,_that.totalPrice);case _Success() when success != null:
return success();case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SalesState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesState.initial()';
}


}




/// @nodoc


class _Loading implements SalesState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesState.loading()';
}


}




/// @nodoc


class _Loaded implements SalesState {
  const _Loaded({required final  List<InventoryItem> availableItems, required final  List<SaleItem> invoiceItems, required this.totalPrice}): _availableItems = availableItems,_invoiceItems = invoiceItems;
  

 final  List<InventoryItem> _availableItems;
 List<InventoryItem> get availableItems {
  if (_availableItems is EqualUnmodifiableListView) return _availableItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableItems);
}

// تمام کالاهای موجود در انبار
 final  List<SaleItem> _invoiceItems;
// تمام کالاهای موجود در انبار
 List<SaleItem> get invoiceItems {
  if (_invoiceItems is EqualUnmodifiableListView) return _invoiceItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invoiceItems);
}

 final  double totalPrice;

/// Create a copy of SalesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._availableItems, _availableItems)&&const DeepCollectionEquality().equals(other._invoiceItems, _invoiceItems)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availableItems),const DeepCollectionEquality().hash(_invoiceItems),totalPrice);

@override
String toString() {
  return 'SalesState.loaded(availableItems: $availableItems, invoiceItems: $invoiceItems, totalPrice: $totalPrice)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $SalesStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<InventoryItem> availableItems, List<SaleItem> invoiceItems, double totalPrice
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of SalesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? availableItems = null,Object? invoiceItems = null,Object? totalPrice = null,}) {
  return _then(_Loaded(
availableItems: null == availableItems ? _self._availableItems : availableItems // ignore: cast_nullable_to_non_nullable
as List<InventoryItem>,invoiceItems: null == invoiceItems ? _self._invoiceItems : invoiceItems // ignore: cast_nullable_to_non_nullable
as List<SaleItem>,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Success implements SalesState {
  const _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SalesState.success()';
}


}




/// @nodoc


class _Error implements SalesState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of SalesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SalesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $SalesStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of SalesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
