import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'localprovider.dart';  // Import the provider
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('hi')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, localizationProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: localizationProvider.locale,
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

// Import the provider

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appTitle').tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('welcomeMessage').tr(),
            ElevatedButton(
              onPressed: () {
                context.read<LocaleProvider>().setLocale(Locale('hi'),context);
              },
              child: Text('Change to hindi'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<LocaleProvider>().setLocale(Locale('en'),context);
              },
              child: Text('Change to English'),
            ),
            ToggleButtons(
              isSelected: [
                context.read<LocaleProvider>().locale.languageCode == 'en',
                context.read<LocaleProvider>().locale.languageCode == 'hi',
              ],
              onPressed: (int index) {
                if (index == 0) {
                  context.read<LocaleProvider>().setLocale(Locale('en'),context);
                } else if (index == 1) {
                  context.read<LocaleProvider>().setLocale(Locale('hi'),context);
                }
              },
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('English'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Hindi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
