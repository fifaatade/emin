import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:emin/src/style/app_color.dart';

class EnterApp extends StatefulWidget {
  const EnterApp({super.key});

  @override
  State<EnterApp> createState() => _EnterAppState();
}

class _EnterAppState extends State<EnterApp> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool("isFirstTime") ?? true;

    if (!mounted) return;

    Future.microtask(() {
      context.go(isFirstTime ? "/onboarding" : "/signin");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 106,
          height: 57,
        ),
      ),
    );
  }
}
