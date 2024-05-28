// // localization_provider.dart
// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
//
// class LocalizationProvider with ChangeNotifier {
//   late Locale _locale;
//   final GlobalKey<NavigatorState> navigatorKey;
//
//   LocalizationProvider(this.navigatorKey) {
//     // Initialize _locale with a default value
//     _locale = Locale('en');
//   }
//
//   Locale get locale => _locale;
//
//   void initializeLocale(BuildContext context) {
//     _locale = EasyLocalization.of(context)!.locale;
//     notifyListeners();
//   }
//
//   void setLocale(Locale locale) {
//     final context = navigatorKey.currentContext;
//     if (context != null) {
//       _locale = locale;
//
//       notifyListeners();
//     } else {
//       // Handle the case when context is not available
//       print('Navigator context is not available yet');
//     }
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale,BuildContext context) {

    _locale = locale;
    EasyLocalization.of(context)!.setLocale(locale);
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale('en'), // English
    const Locale('hi'), // Hindi
  ];
}

