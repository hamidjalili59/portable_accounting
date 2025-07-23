import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Enum برای نگهداری انواع واحد پولی و مقادیر آن‌ها
enum CurrencyUnit {
  rial,
  toman,
  thousandRial,
  thousandToman;

  // نام نمایشی برای هر واحد
  String get displayName {
    switch (this) {
      case CurrencyUnit.rial:
        return 'ریال';
      case CurrencyUnit.toman:
        return 'تومان';
      case CurrencyUnit.thousandRial:
        return 'هزار ریال';
      case CurrencyUnit.thousandToman:
        return 'هزار تومان';
    }
  }

  // مقداری که قیمت اصلی (ریال) باید بر آن تقسیم شود
  double get divisor {
    switch (this) {
      case CurrencyUnit.rial:
        return 1.0;
      case CurrencyUnit.toman:
        return 10.0;
      case CurrencyUnit.thousandRial:
        return 1000.0;
      case CurrencyUnit.thousandToman:
        return 10000.0;
    }
  }
}

// Cubit برای مدیریت و ذخیره‌سازی واحد پولی انتخاب شده
class CurrencyCubit extends Cubit<CurrencyUnit> {
  CurrencyCubit() : super(CurrencyUnit.rial) {
    // حالت پیش‌فرض
    _loadCurrency();
  }

  static const String _currencyKey = 'currency_unit';

  void _loadCurrency() async {
    final prefs = await SharedPreferences.getInstance();
    final currencyName =
        prefs.getString(_currencyKey) ?? CurrencyUnit.rial.name;
    emit(CurrencyUnit.values.firstWhere((e) => e.name == currencyName));
  }

  void setCurrency(CurrencyUnit newUnit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currencyKey, newUnit.name);
    emit(newUnit);
  }
}
