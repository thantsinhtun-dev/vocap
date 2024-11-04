import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:vocap/src/core/app_animation.dart';
import 'package:vocap/src/core/app_colors.dart';
import 'package:vocap/src/core/app_fonts.dart';
import 'package:vocap/src/routes/app_route.dart';
import 'package:vocap/src/routes/app_route_data.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), ()  {
      LoginRoute().pushReplacement(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Lottie.asset(AppAnimation.aniTest),
          Text(
            "VOCAP",
            style: context.appFonts.customFont(
              fontSize: FontSize.s34,
              fontWeight: FontWeight.w700,
              color: context.appColors.colorSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Text(
          textAlign: TextAlign.center,
          "V1.0.0 (1)",
          style: context.appFonts.customFont(
            fontSize: FontSize.s12,
            color: context.appColors.colorSecondary,
          ),
        ),
      ),
    );
  }
}
