import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_app/core/theme/app_colors.dart';
import 'package:super_app/route/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    toHome();
    super.initState();
  }

  Future<void> toHome() async {
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: ThemeColors.light.background,
          body: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: SvgPicture.asset('assets/svg/logo.svg'),
                ),
              ),
            ],
          ),
        ),
      );
}
