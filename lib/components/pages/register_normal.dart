import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_stripe_web/components/parts/normal_stripe_web.dart';
import 'package:flutter_stripe_web/components/parts/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterNormal extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final name = useProvider(nameProvider).state;
    Future<void> addNormal() async {
      try {
        await FirebaseFirestore.instance
            .collection('normal')
            .doc(user.uid)
            .set({
          'email': user.email,
          'name': name,
        });
        await normalCheckout(context);
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
        title: Text('Register normal'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('plz type your info!'),
            TextField(
              onChanged: (value) {
                context.read(nameProvider).state = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                addNormal();
              },
              child: Text('Register!!!'),
            ),
          ],
        ),
      ),
    );
  }
}
