import 'package:flutter/material.dart';
import 'package:soil_npk_app/l10n/l10n.dart';
import 'package:provider/provider.dart';

class LocaleProvider extends ChangeNotifier {
   Locale? _locale;

  Locale? get locale => _locale;

  

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
   
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
