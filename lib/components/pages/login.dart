import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe_web/components/parts/providers.dart';

class Login extends HookWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final String email = useProvider(emailProvider).state;
    final String password = useProvider(passwordProvider).state;
    Future<void> loginMethod() async {
      try {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pushNamed(context, '/');
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$error'),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('plz login here'),
            TextField(
              onChanged: (value) {
                context.read(emailProvider).state = value;
              },
              decoration: InputDecoration(
                hintText: 'email',
                filled: true,
              ),
            ),
            TextField(
              onChanged: (value) {
                context.read(passwordProvider).state = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password',
                filled: true,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('if you do not have an account yet, tap here!'),
            ),
            ElevatedButton(
              onPressed: () {
                loginMethod();
              },
              child: Text('Login!!!'),
            ),
          ],
        ),
      ),
    );
  }
}
