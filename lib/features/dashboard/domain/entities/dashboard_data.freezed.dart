// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardData {

 double get totalRevenue; double get totalCost; double get totalProfit; List<DailyProfit> get lastWeekProfit; int get totalSalesCount; List<TopSellingProduct> get topSellingProducts;
/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardDataCopyWith<DashboardData> get copyWith => _$DashboardDataCopyWithImpl<DashboardData>(this as DashboardData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardData&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.totalCost, totalCost) || other.totalCost == totalCost)&&(identical(other.totalProfit, totalProfit) || other.totalProfit == totalProfit)&&const DeepCollectionEquality().equals(other.lastWeekProfit, lastWeekProfit)&&(identical(other.totalSalesCount, totalSalesCount) || other.totalSalesCount == totalSalesCount)&&const DeepCollectionEquality().equals(other.topSellingProducts, topSellingProducts));
}


@override
int get hashCode => Object.hash(runtimeType,totalRevenue,totalCost,totalProfit,const DeepCollectionEquality().hash(lastWeekProfit),totalSalesCount,const DeepCollectionEquality().hash(topSellingProducts));

@override
String toString() {
  return 'DashboardData(totalRevenue: $totalRevenue, totalCost: $totalCost, totalProfit: $totalProfit, lastWeekProfit: $lastWeekProfit, totalSalesCount: $totalSalesCount, topSellingProducts: $topSellingProducts)';
}


}

/// @nodoc
abstract mixin class $DashboardDataCopyWith<$Res>  {
  factory $DashboardDataCopyWith(DashboardData value, $Res Function(DashboardData) _then) = _$DashboardDataCopyWithImpl;
@useResult
$Res call({
 double totalRevenue, double totalCost, double totalProfit, List<DailyProfit> lastWeekProfit, int totalSalesCount, List<TopSellingProduct> topSellingProducts
});




}
/// @nodoc
class _$DashboardDataCopyWithImpl<$Res>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._self, this._then);

  final DashboardData _self;
  final $Res Function(DashboardData) _then;

/// Create a copy of DashboardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRevenue = null,Object? totalCost = null,Object? totalProfit = null,Object? lastWeekProfit = null,Object? totalSalesCount = null,Object? topSellingProducts = null,}) {
  return _then(DashboardData(
totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as double,totalCost: null == totalCost ? _self.totalCost : totalCost // ignore: cast_nullable_to_non_nullable
as double,totalProfit: null == totalProfit ? _self.totalProfit : totalProfit // ignore: cast_nullable_to_non_nullable
as double,lastWeekProfit: null == lastWeekProfit ? _self.lastWeekProfit : lastWeekProfit // ignore: cast_nullable_to_non_nullable
as List<DailyProfit>,totalSalesCount: null == totalSalesCount ? _self.totalSalesCount : totalSalesCount // ignore: cast_nullable_to_non_nullable
as int,topSellingProducts: null == topSellingProducts ? _self.topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<TopSellingProduct>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardData].
extension DashboardDataPatterns on DashboardData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$DailyProfit {

 DateTime get date; double get profit;
/// Create a copy of DailyProfit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyProfitCopyWith<DailyProfit> get copyWith => _$DailyProfitCopyWithImpl<DailyProfit>(this as DailyProfit, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyProfit&&(identical(other.date, date) || other.date == date)&&(identical(other.profit, profit) || other.profit == profit));
}


@override
int get hashCode => Object.hash(runtimeType,date,profit);

@override
String toString() {
  return 'DailyProfit(date: $date, profit: $profit)';
}


}

/// @nodoc
abstract mixin class $DailyProfitCopyWith<$Res>  {
  factory $DailyProfitCopyWith(DailyProfit value, $Res Function(DailyProfit) _then) = _$DailyProfitCopyWithImpl;
@useResult
$Res call({
 DateTime date, double profit
});




}
/// @nodoc
class _$DailyProfitCopyWithImpl<$Res>
    implements $DailyProfitCopyWith<$Res> {
  _$DailyProfitCopyWithImpl(this._self, this._then);

  final DailyProfit _self;
  final $Res Function(DailyProfit) _then;

/// Create a copy of DailyProfit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? profit = null,}) {
  return _then(DailyProfit(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,profit: null == profit ? _self.profit : profit // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyProfit].
extension DailyProfitPatterns on DailyProfit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$TopSellingProduct {

 String get name; int get quantitySold;
/// Create a copy of TopSellingProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellingProductCopyWith<TopSellingProduct> get copyWith => _$TopSellingProductCopyWithImpl<TopSellingProduct>(this as TopSellingProduct, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSellingProduct&&(identical(other.name, name) || other.name == name)&&(identical(other.quantitySold, quantitySold) || other.quantitySold == quantitySold));
}


@override
int get hashCode => Object.hash(runtimeType,name,quantitySold);

@override
String toString() {
  return 'TopSellingProduct(name: $name, quantitySold: $quantitySold)';
}


}

/// @nodoc
abstract mixin class $TopSellingProductCopyWith<$Res>  {
  factory $TopSellingProductCopyWith(TopSellingProduct value, $Res Function(TopSellingProduct) _then) = _$TopSellingProductCopyWithImpl;
@useResult
$Res call({
 String name, int quantitySold
});




}
/// @nodoc
class _$TopSellingProductCopyWithImpl<$Res>
    implements $TopSellingProductCopyWith<$Res> {
  _$TopSellingProductCopyWithImpl(this._self, this._then);

  final TopSellingProduct _self;
  final $Res Function(TopSellingProduct) _then;

/// Create a copy of TopSellingProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? quantitySold = null,}) {
  return _then(TopSellingProduct(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantitySold: null == quantitySold ? _self.quantitySold : quantitySold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopSellingProduct].
extension TopSellingProductPatterns on TopSellingProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
