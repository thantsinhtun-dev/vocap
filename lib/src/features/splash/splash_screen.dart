import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:vocap/src/features/login/provider/auth_provider.dart';
import '../../core/app_colors.dart';
import '../../core/app_animation.dart';
import '../../core/app_fonts.dart';
import '../../routes/app_route_data.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      print("init");
      _initUserInfo();
    });
  }

  _initUserInfo() {
    ref.read(authControllerProvider.notifier).checkUserLogin(
          onSuccess: (_) {
            print("success");
            HomeRoute().pushReplacement(context);
          },
          onFailure: (_) {
            print("error");

            LoginRoute().pushReplacement(context);
          },
        );
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
