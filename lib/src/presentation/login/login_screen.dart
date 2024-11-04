import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vocap/src/core/app_colors.dart';
import 'package:vocap/src/core/app_fonts.dart';
import 'package:vocap/src/core/app_images.dart';
import 'package:vocap/src/core/app_strings.dart';
import 'package:vocap/src/core/dimens.dart';
import 'package:vocap/src/routes/app_route_data.dart';

import '../../../src/core/app_animation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // physics: const NeverScrollableScrollPhysics(),
          children: [
            Lottie.asset(AppAnimation.aniTest, height: 250),
            Text(
              "VOCAP",
              style: context.appFonts.customFont(
                fontSize: FontSize.s34,
                fontWeight: FontWeight.w700,
                color: context.appColors.colorSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SocialLoginButton(
              title: 'Continue with Google',
              titleColor: context.appColors.colorSecondaryText,
              bgColor: context.appColors.colorWhite,
              logo: AppImages.logoGoogle,
              onPressed: ()  {
                 HomeRoute().go(context);
              },
            ),
            const SizedBox(height: kMarginMedium),
            SocialLoginButton(
              title: 'Continue with Facebook',
              titleColor: context.appColors.colorWhite,
              bgColor: context.appColors.colorBlue,
              logo: AppImages.logoFB,
              onPressed: () {},
            ),
            const SizedBox(height: kMarginMedium),
            SocialLoginButton(
              title: 'Continue with Apple',
              titleColor: context.appColors.colorWhite,
              bgColor: context.appColors.colorGrey,
              logo: AppImages.logoApple,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.title,
    required this.titleColor,
    required this.bgColor,
    required this.logo,
    required this.onPressed,
  });

  final String title;
  final Color titleColor;
  final Color bgColor;
  final String logo;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginLarge),
      child: MaterialButton(
        onPressed: ()=> onPressed(),
        color: bgColor,
        height: 56,
        padding: const EdgeInsets.symmetric(
          vertical: kMarginMedium,
          horizontal: kMarginLarge,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kMarginCardMedium),
        ),
        child: Row(
          children: [
            Image.asset(logo, height: kMarginLarge),
            const SizedBox(width: kMarginMedium_2),
            Text(
              title,
              style: context.appFonts.customFont(
                fontWeight: FontWeight.w600,
                fontSize: FontSize.s15,
                color: titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
