import 'package:flutter/material.dart';
import 'package:sappy/provider/user_role.dart';
import 'screens/login_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:sappy/provider/cattle_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WakelockPlus.enable();
  // // Set warna notification bar agar sama seperti background
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Color(0xFFC35804), // Ubah warna sesuai dengan background
  //   statusBarIconBrightness:
  //       Brightness.dark, // Warna ikon di status bar (dark untuk teks gelap)
  // ));

  await dotenv.load();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserRole()),
      ChangeNotifierProvider(create: (_) => CattleProvider()),
    ],
    child: const MyApp(),
  ));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        fontFamily: 'Inter',
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Builder(
        builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: const LoginScreen(),
          );
        },
      ),
    );
  }
}
