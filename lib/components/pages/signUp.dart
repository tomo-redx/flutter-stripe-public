import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe_web/components/parts/providers.dart';

class SignUp extends HookWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final email = useProvider(emailProvider).state;
    final password = useProvider(passwordProvider).state;
    final confirmPassword = useProvider(confirmPasswordProvider).state;
    Future<void> addUser() async {
      try {
        await _auth.createUserWithEmailAndPassword(
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
        title: Text('Sign up'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('plz create a new account here'),
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
            TextField(
              onChanged: (value) {
                context.read(confirmPasswordProvider).state = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password to confirm',
                filled: true,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('if you already have an account, tap here!'),
            ),
            ElevatedButton(
              onPressed: () {
                if (email == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Email is empty'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    ),
                  );
                } else if (password == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Password is empty'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    ),
                  );
                } else if (password == confirmPassword) {
                  addUser();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                          'Password to confirm should be equal to password'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    ),
                  );
                }
              },
              child: Text('Sign up!!!'),
            ),
          ],
        ),
      ),
    );
  }
}
