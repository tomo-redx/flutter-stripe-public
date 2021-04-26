import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_stripe_web/components/pages/cancel.dart';
import 'package:flutter_stripe_web/components/pages/home.dart';
import 'package:flutter_stripe_web/components/pages/login.dart';
import 'package:flutter_stripe_web/components/pages/register_normal.dart';
import 'package:flutter_stripe_web/components/pages/register_prime.dart';
import 'package:flutter_stripe_web/components/pages/signUp.dart';
import 'package:flutter_stripe_web/components/pages/success.dart';
import 'package:flutter_stripe_web/components/parts/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Stripe for web Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            buttonColor: Colors.amber,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
            '/login': (context) => Login(),
            '/signup': (context) => SignUp(),
            '/register-normal': (context) => RegisterNormal(),
            '/register-prime': (context) => RegisterPrime(),
            '/success': (context) => Success(),
            '/cancel': (context) => Cancel(),
          },
        );
      },
    );
  }
}

class isLoggedInNormal extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return useProvider(isLoggedInProvider).state ? RegisterNormal() : Login();
  }
}

class isLoggedInPrime extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return useProvider(isLoggedInProvider).state ? RegisterPrime() : Login();
  }
}
