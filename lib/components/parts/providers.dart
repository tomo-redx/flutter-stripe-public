import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

final isLoggedInProvider = StateProvider<bool>((ref) {
  final User user = _auth.currentUser;
  if (user == null) {
    return false;
  } else {
    return true;
  }
});
final emailProvider = StateProvider.autoDispose<String>((ref) => '');
final passwordProvider = StateProvider.autoDispose<String>((ref) => '');
final confirmPasswordProvider = StateProvider.autoDispose<String>((ref) => '');
final nameProvider = StateProvider<String>((ref) => '');
