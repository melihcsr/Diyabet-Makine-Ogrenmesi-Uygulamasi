import 'package:bitirme/ViewModels/QuestionsPageViewModel.dart';
import 'package:bitirme/models/result_model.dart';
import 'package:bitirme/pages/OnboardingView.dart';
import 'package:bitirme/pages/QuestionsView.dart';
import 'package:bitirme/pages/data_page.dart';
import 'package:bitirme/pages/first_page.dart';
import 'package:bitirme/pages/onboarding_page.dart';
import 'package:bitirme/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuestionsPageViewModel()),
      ],
      child: MaterialApp(
        title: 'Diyabet',
        debugShowCheckedModeBanner: false,
        home: OnboardingView(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('tr', ''),
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          // If there is no supporting language select en
          return supportedLocales.first;
        },
      ),
    );
  }
}
