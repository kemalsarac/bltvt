// @dart=2.9
import 'dart:async';
import 'package:bltvt_mobile_veterinary/screens/auth/sign_in_screen.dart';
import 'package:bltvt_mobile_veterinary/services/general_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BuildContext globalContext;
  StreamSubscription tokenExpiredSub;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    tokenExpiredSub = apiService.tokenExpired$.listen((event) {
      // authenticationService.logout();
      Navigator.of(navigatorKey.currentContext).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignInScreen()), (Route<dynamic> route) => false);
    });

    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    if (tokenExpiredSub != null) {
      tokenExpiredSub.cancel();
    }
    super.dispose();
  }

  Future<void> initPlatformState() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr'),
        Locale('en'),
      ],
      home: const SignInScreen(),
    );
  }
}
