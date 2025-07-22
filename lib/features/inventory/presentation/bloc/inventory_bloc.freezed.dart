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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadInventory value)?  loadInventory,TResult Function( AddItem value)?  addItem,TResult Function( UpdateItem value)?  updateItem,TResult Function( DeleteItem value)?  deleteItem,TResult Function( SearchChanged value)?  searchChanged,TResult Function( SortOrderChanged value)?  sortOrderChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadInventory() when loadInventory != null:
return loadInventory(_that);case AddItem() when addItem != null:
return addItem(_that);case UpdateItem() when updateItem != null:
return updateItem(_that);case DeleteItem() when deleteItem != null:
return deleteItem(_that);case SearchChanged() when searchChanged != null:
return searchChanged(_that);case SortOrderChanged() when sortOrderChanged != null:
return sortOrderChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadInventory value)  loadInventory,required TResult Function( AddItem value)  addItem,required TResult Function( UpdateItem value)  updateItem,required TResult Function( DeleteItem value)  deleteItem,required TResult Function( SearchChanged value)  searchChanged,required TResult Function( SortOrderChanged value)  sortOrderChanged,}){
final _that = this;
switch (_that) {
case LoadInventory():
return loadInventory(_that);case AddItem():
return addItem(_that);case UpdateItem():
return updateItem(_that);case DeleteItem():
return deleteItem(_that);case SearchChanged():
return searchChanged(_that);case SortOrderChanged():
return sortOrderChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadInventory value)?  loadInventory,TResult? Function( AddItem value)?  addItem,TResult? Function( UpdateItem value)?  updateItem,TResult? Function( DeleteItem value)?  deleteItem,TResult? Function( SearchChanged value)?  searchChanged,TResult? Function( SortOrderChanged value)?  sortOrderChanged,}){
final _that = this;
switch (_that) {
case LoadInventory() when loadInventory != null:
return loadInventory(_that);case AddItem() when addItem != null:
return addItem(_that);case UpdateItem() when updateItem != null:
return updateItem(_that);case DeleteItem() when deleteItem != null:
return deleteItem(_that);case SearchChanged() when searchChanged != null:
return searchChanged(_that);case SortOrderChanged() when sortOrderChanged != null:
return sortOrderChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadInventory,TResult Function( InventoryItem item)?  addItem,TResult Function( InventoryItem item)?  updateItem,TResult Function( int id)?  deleteItem,TResult Function( String query)?  searchChanged,TResult Function( InventorySortOrder sortOrder)?  sortOrderChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadInventory() when loadInventory != null:
return loadInventory();case AddItem() when addItem != null:
return addItem(_that.item);case UpdateItem() when updateItem != null:
return updateItem(_that.item);case DeleteItem() when deleteItem != null:
return deleteItem(_that.id);case SearchChanged() when searchChanged != null:
return searchChanged(_that.query);case SortOrderChanged() when sortOrderChanged != null:
return sortOrderChanged(_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadInventory,required TResult Function( InventoryItem item)  addItem,required TResult Function( InventoryItem item)  updateItem,required TResult Function( int id)  deleteItem,required TResult Function( String query)  searchChanged,required TResult Function( InventorySortOrder sortOrder)  sortOrderChanged,}) {final _that = this;
switch (_that) {
case LoadInventory():
return loadInventory();case AddItem():
return addItem(_that.item);case UpdateItem():
return updateItem(_that.item);case DeleteItem():
return deleteItem(_that.id);case SearchChanged():
return searchChanged(_that.query);case SortOrderChanged():
return sortOrderChanged(_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadInventory,TResult? Function( InventoryItem item)?  addItem,TResult? Function( InventoryItem item)?  updateItem,TResult? Function( int id)?  deleteItem,TResult? Function( String query)?  searchChanged,TResult? Function( InventorySortOrder sortOrder)?  sortOrderChanged,}) {final _that = this;
switch (_that) {
case LoadInventory() when loadInventory != null:
return loadInventory();case AddItem() when addItem != null:
return addItem(_that.item);case UpdateItem() when updateItem != null:
return updateItem(_that.item);case DeleteItem() when deleteItem != null:
return deleteItem(_that.id);case SearchChanged() when searchChanged != null:
return searchChanged(_that.query);case SortOrderChanged() when sortOrderChanged != null:
return sortOrderChanged(_that.sortOrder);case _:
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


class SearchChanged implements InventoryEvent {
  const SearchChanged(this.query);
  

 final  String query;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchChangedCopyWith<SearchChanged> get copyWith => _$SearchChangedCopyWithImpl<SearchChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'InventoryEvent.searchChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchChangedCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory $SearchChangedCopyWith(SearchChanged value, $Res Function(SearchChanged) _then) = _$SearchChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchChangedCopyWithImpl<$Res>
    implements $SearchChangedCopyWith<$Res> {
  _$SearchChangedCopyWithImpl(this._self, this._then);

  final SearchChanged _self;
  final $Res Function(SearchChanged) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SortOrderChanged implements InventoryEvent {
  const SortOrderChanged(this.sortOrder);
  

 final  InventorySortOrder sortOrder;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SortOrderChangedCopyWith<SortOrderChanged> get copyWith => _$SortOrderChangedCopyWithImpl<SortOrderChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortOrderChanged&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,sortOrder);

@override
String toString() {
  return 'InventoryEvent.sortOrderChanged(sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $SortOrderChangedCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory $SortOrderChangedCopyWith(SortOrderChanged value, $Res Function(SortOrderChanged) _then) = _$SortOrderChangedCopyWithImpl;
@useResult
$Res call({
 InventorySortOrder sortOrder
});




}
/// @nodoc
class _$SortOrderChangedCopyWithImpl<$Res>
    implements $SortOrderChangedCopyWith<$Res> {
  _$SortOrderChangedCopyWithImpl(this._self, this._then);

  final SortOrderChanged _self;
  final $Res Function(SortOrderChanged) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sortOrder = null,}) {
  return _then(SortOrderChanged(
null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as InventorySortOrder,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case Loaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<InventoryItem> originalItems,  List<InventoryItem> displayedItems,  String searchQuery,  InventorySortOrder sortOrder)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.originalItems,_that.displayedItems,_that.searchQuery,_that.sortOrder);case _Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<InventoryItem> originalItems,  List<InventoryItem> displayedItems,  String searchQuery,  InventorySortOrder sortOrder)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case Loaded():
return loaded(_that.originalItems,_that.displayedItems,_that.searchQuery,_that.sortOrder);case _Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<InventoryItem> originalItems,  List<InventoryItem> displayedItems,  String searchQuery,  InventorySortOrder sortOrder)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.originalItems,_that.displayedItems,_that.searchQuery,_that.sortOrder);case _Error() when error != null:
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


class Loaded implements InventoryState {
  const Loaded({required final  List<InventoryItem> originalItems, required final  List<InventoryItem> displayedItems, this.searchQuery = '', this.sortOrder = InventorySortOrder.byNameAsc}): _originalItems = originalItems,_displayedItems = displayedItems;
  

 final  List<InventoryItem> _originalItems;
 List<InventoryItem> get originalItems {
  if (_originalItems is EqualUnmodifiableListView) return _originalItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_originalItems);
}

// لیست اصلی و دست‌نخورده
 final  List<InventoryItem> _displayedItems;
// لیست اصلی و دست‌نخورده
 List<InventoryItem> get displayedItems {
  if (_displayedItems is EqualUnmodifiableListView) return _displayedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_displayedItems);
}

// لیست فیلتر و مرتب شده برای نمایش
@JsonKey() final  String searchQuery;
@JsonKey() final  InventorySortOrder sortOrder;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&const DeepCollectionEquality().equals(other._originalItems, _originalItems)&&const DeepCollectionEquality().equals(other._displayedItems, _displayedItems)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_originalItems),const DeepCollectionEquality().hash(_displayedItems),searchQuery,sortOrder);

@override
String toString() {
  return 'InventoryState.loaded(originalItems: $originalItems, displayedItems: $displayedItems, searchQuery: $searchQuery, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 List<InventoryItem> originalItems, List<InventoryItem> displayedItems, String searchQuery, InventorySortOrder sortOrder
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? originalItems = null,Object? displayedItems = null,Object? searchQuery = null,Object? sortOrder = null,}) {
  return _then(Loaded(
originalItems: null == originalItems ? _self._originalItems : originalItems // ignore: cast_nullable_to_non_nullable
as List<InventoryItem>,displayedItems: null == displayedItems ? _self._displayedItems : displayedItems // ignore: cast_nullable_to_non_nullable
as List<InventoryItem>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as InventorySortOrder,
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
