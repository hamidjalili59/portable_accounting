// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryEvent()';
}


}

/// @nodoc
class $InventoryEventCopyWith<$Res>  {
$InventoryEventCopyWith(InventoryEvent _, $Res Function(InventoryEvent) __);
}


/// Adds pattern-matching-related methods to [InventoryEvent].
extension InventoryEventPatterns on InventoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadInventory value)?  loadInventory,TResult Function( AddItem value)?  addItem,TResult Function( UpdateItem value)?  updateItem,TResult Function( DeleteItem value)?  deleteItem,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadInventory() when loadInventory != null:
return loadInventory(_that);case AddItem() when addItem != null:
return addItem(_that);case UpdateItem() when updateItem != null:
return updateItem(_that);case DeleteItem() when deleteItem != null:
return deleteItem(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadInventory value)  loadInventory,required TResult Function( AddItem value)  addItem,required TResult Function( UpdateItem value)  updateItem,required TResult Function( DeleteItem value)  deleteItem,}){
final _that = this;
switch (_that) {
case LoadInventory():
return loadInventory(_that);case AddItem():
return addItem(_that);case UpdateItem():
return updateItem(_that);case DeleteItem():
return deleteItem(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadInventory value)?  loadInventory,TResult? Function( AddItem value)?  addItem,TResult? Function( UpdateItem value)?  updateItem,TResult? Function( DeleteItem value)?  deleteItem,}){
final _that = this;
switch (_that) {
case LoadInventory() when loadInventory != null:
return loadInventory(_that);case AddItem() when addItem != null:
return addItem(_that);case UpdateItem() when updateItem != null:
return updateItem(_that);case DeleteItem() when deleteItem != null:
return deleteItem(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadInventory,TResult Function( InventoryItem item)?  addItem,TResult Function( InventoryItem item)?  updateItem,TResult Function( int id)?  deleteItem,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadInventory() when loadInventory != null:
return loadInventory();case AddItem() when addItem != null:
return addItem(_that.item);case UpdateItem() when updateItem != null:
return updateItem(_that.item);case DeleteItem() when deleteItem != null:
return deleteItem(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadInventory,required TResult Function( InventoryItem item)  addItem,required TResult Function( InventoryItem item)  updateItem,required TResult Function( int id)  deleteItem,}) {final _that = this;
switch (_that) {
case LoadInventory():
return loadInventory();case AddItem():
return addItem(_that.item);case UpdateItem():
return updateItem(_that.item);case DeleteItem():
return deleteItem(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadInventory,TResult? Function( InventoryItem item)?  addItem,TResult? Function( InventoryItem item)?  updateItem,TResult? Function( int id)?  deleteItem,}) {final _that = this;
switch (_that) {
case LoadInventory() when loadInventory != null:
return loadInventory();case AddItem() when addItem != null:
return addItem(_that.item);case UpdateItem() when updateItem != null:
return updateItem(_that.item);case DeleteItem() when deleteItem != null:
return deleteItem(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class LoadInventory implements InventoryEvent {
  const LoadInventory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadInventory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryEvent.loadInventory()';
}


}




/// @nodoc


class AddItem implements InventoryEvent {
  const AddItem(this.item);
  

 final  InventoryItem item;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddItemCopyWith<AddItem> get copyWith => _$AddItemCopyWithImpl<AddItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddItem&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'InventoryEvent.addItem(item: $item)';
}


}

/// @nodoc
abstract mixin class $AddItemCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory $AddItemCopyWith(AddItem value, $Res Function(AddItem) _then) = _$AddItemCopyWithImpl;
@useResult
$Res call({
 InventoryItem item
});


$InventoryItemCopyWith<$Res> get item;

}
/// @nodoc
class _$AddItemCopyWithImpl<$Res>
    implements $AddItemCopyWith<$Res> {
  _$AddItemCopyWithImpl(this._self, this._then);

  final AddItem _self;
  final $Res Function(AddItem) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(AddItem(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as InventoryItem,
  ));
}

/// Create a copy of InventoryEvent
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


class UpdateItem implements InventoryEvent {
  const UpdateItem(this.item);
  

 final  InventoryItem item;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateItemCopyWith<UpdateItem> get copyWith => _$UpdateItemCopyWithImpl<UpdateItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateItem&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'InventoryEvent.updateItem(item: $item)';
}


}

/// @nodoc
abstract mixin class $UpdateItemCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory $UpdateItemCopyWith(UpdateItem value, $Res Function(UpdateItem) _then) = _$UpdateItemCopyWithImpl;
@useResult
$Res call({
 InventoryItem item
});


$InventoryItemCopyWith<$Res> get item;

}
/// @nodoc
class _$UpdateItemCopyWithImpl<$Res>
    implements $UpdateItemCopyWith<$Res> {
  _$UpdateItemCopyWithImpl(this._self, this._then);

  final UpdateItem _self;
  final $Res Function(UpdateItem) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(UpdateItem(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as InventoryItem,
  ));
}

/// Create a copy of InventoryEvent
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


class DeleteItem implements InventoryEvent {
  const DeleteItem(this.id);
  

 final  int id;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteItemCopyWith<DeleteItem> get copyWith => _$DeleteItemCopyWithImpl<DeleteItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteItem&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'InventoryEvent.deleteItem(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteItemCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory $DeleteItemCopyWith(DeleteItem value, $Res Function(DeleteItem) _then) = _$DeleteItemCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteItemCopyWithImpl<$Res>
    implements $DeleteItemCopyWith<$Res> {
  _$DeleteItemCopyWithImpl(this._self, this._then);

  final DeleteItem _self;
  final $Res Function(DeleteItem) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteItem(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$InventoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState()';
}


}

/// @nodoc
class $InventoryStateCopyWith<$Res>  {
$InventoryStateCopyWith(InventoryState _, $Res Function(InventoryState) __);
}


/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<InventoryItem> items)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.items);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<InventoryItem> items)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.items);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<InventoryItem> items)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.items);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements InventoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState.initial()';
}


}




/// @nodoc


class _Loading implements InventoryState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState.loading()';
}


}




/// @nodoc


class _Loaded implements InventoryState {
  const _Loaded(final  List<InventoryItem> items): _items = items;
  

 final  List<InventoryItem> _items;
 List<InventoryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'InventoryState.loaded(items: $items)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<InventoryItem> items
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_Loaded(
null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<InventoryItem>,
  ));
}


}

/// @nodoc


class _Error implements InventoryState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of InventoryState
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
  return 'InventoryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
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

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
