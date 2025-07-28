import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Enum to represent the calculation choices
enum StockValueCalculation {
  basedOnPurchasePrice,
  basedOnSalePrice,
}

class SettingsCubit extends Cubit<StockValueCalculation> {
  SettingsCubit() : super(StockValueCalculation.basedOnPurchasePrice) { // Default value
    _loadSetting();
  }

  static const String _settingKey = 'stock_value_calculation';

  void _loadSetting() async {
    final prefs = await SharedPreferences.getInstance();
    final settingName = prefs.getString(_settingKey) ?? StockValueCalculation.basedOnPurchasePrice.name;
    emit(StockValueCalculation.values.firstWhere((e) => e.name == settingName));
  }

  void setStockValueCalculation(StockValueCalculation newSetting) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingKey, newSetting.name);
    emit(newSetting);
  }
}