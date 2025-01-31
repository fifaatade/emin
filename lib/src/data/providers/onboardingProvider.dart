import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class OnboardingProvider extends ChangeNotifier {
  bool _isFirstTime = true;
  late SharedPreferences prefs;

  bool get isFirstTime => _isFirstTime;

  OnboardingProvider(this.prefs) {
    _isFirstTime = prefs.getBool('isFirstTime') ?? true;
  }

  Future<void> completeOnboarding(BuildContext context) async {
    await prefs.setBool('isFirstTime', false);
    _isFirstTime = false;
    notifyListeners();
    context.go('/home');
  }
}
