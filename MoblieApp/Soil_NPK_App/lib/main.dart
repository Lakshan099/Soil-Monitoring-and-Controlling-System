import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:soil_npk_app/Screens/Welcome/welcome_screen.dart';
import 'package:soil_npk_app/components/locale_provider.dart';
import 'package:soil_npk_app/l10n/l10n.dart';
import 'package:soil_npk_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:soil_npk_app/components/notificationLocation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:soil_npk_app/components/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:soil_npk_app/components/theme_picker.dart';
import 'package:soil_npk_app/provider/google_sign_in.dart';

Future<void> main() async {
  NotificationService().initAwesomeNotification();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(), //ThemeProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
//     MultiProvider(
//     providers: [
//  Provider(create: (context) => LocaleProvider()),
//   Provider(create: (context) => ThemeProvider()),
//    Provider(create: (context) => GoogleSignInProvider()),
//     ],

          //create: (context) => ThemeProvider(),
          //create: (context) => GoogleSignInProvider(),

          //final themeProvider = Provider.of<ThemeProvider>(context);

        return   MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Soil App',
            themeMode: ThemeMode.system,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: const WelcomeScreen(),
          );
        },
      );
}
