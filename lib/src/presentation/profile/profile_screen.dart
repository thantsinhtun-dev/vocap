import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocap/src/core/app_colors.dart';
import 'package:vocap/src/core/app_fonts.dart';
import 'package:vocap/src/core/dimens.dart';

import '../../../src/core/app_images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: context.appFonts.customFont(
            fontSize: FontSize.s18,
            color: context.appColors.colorWhite,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundColor: context.appColors.colorAccent,
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: CachedNetworkImageProvider(
                  "https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg",
                ),
              ),
            ),
            const SizedBox(height: kMarginMedium),
            Text(
              "Thant Sin Htun",
              style: context.appFonts.customFont(
                fontSize: FontSize.s18,
                color: context.appColors.colorWhite,
              ),
            ),
            Text(
              "thantsin.dev@gmail.com",
              style: context.appFonts.customFont(
                fontSize: FontSize.s12,
                color: context.appColors.colorAccent,
              ),
            ),
            const SizedBox(height: kMarginMedium),
            SettingSettings(),
            PrimaryButton(
              title: 'Clear All Data',
              textColor: context.appColors.colorWhite,
              bgColor: context.appColors.colorRed,
              padding: const EdgeInsets.symmetric(
                horizontal: kMarginMedium_2,
                vertical: kMarginMedium_2,
              ),
              onPressed: () {},
            ),
            Spacer(),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: kMarginMedium_2),
              child: Divider(
                thickness: 1,
                color: Colors.white30,
              ),
            ),
            PrimaryButton(
              title: 'Logout',
              textColor: context.appColors.colorRed,
              bgColor: context.appColors.colorWhite.withOpacity(0.8),
              splashColor: context.appColors.colorWhite,
              padding: const EdgeInsets.symmetric(
                horizontal: kMarginMedium_2,
                vertical: kMarginMedium_2,
              ),
              onPressed: () {},
            )
          ],
        ),
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

class SettingSettings extends StatefulWidget {
  const SettingSettings({super.key});

  @override
  State<SettingSettings> createState() => _SettingSettingsState();
}

class _SettingSettingsState extends State<SettingSettings> {
  bool track = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kMarginMedium_2),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Settings",
              style: context.appFonts.customFont(
                fontSize: FontSize.s18,
                color: context.appColors.colorWhite,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: kMarginCardMedium),
          SettingSwitchListTile(title: "English", track: track, onChange: (value) {
            setState(() {
              track = value;
            });
          }),
          const SizedBox(height: kMarginCardMedium),
          SettingSwitchListTile(title: "Dark Mode", track: false, onChange: (value) {}),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.textColor,
    this.bgColor,
    this.splashColor,
    required this.padding,
    required this.onPressed,
  });

  final String title;
  final Color? textColor;
  final Color? bgColor;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
           const EdgeInsets.symmetric(horizontal: kMarginMedium_2),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 48,
        color: bgColor ?? context.appColors.colorSecondary,
        splashColor: splashColor ?? context.appColors.colorPrimaryText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kMarginMedium_2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: kMarginMedium_2),
        child: Text(
          title,
          style: context.appFonts.customFont(
            fontSize: FontSize.s16,
            color: textColor ?? context.appColors.colorWhite ,
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}

class SettingSwitchListTile extends StatelessWidget {
  const SettingSwitchListTile({
    super.key,
    required this.title,
    required this.track,
    required this.onChange,
  });

  final String title;
  final bool track;
  final Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      tileColor: Colors.white12,
      value: track,
      contentPadding: const EdgeInsets.symmetric(horizontal: kMarginMedium_2),
      inactiveThumbColor: context.appColors.colorSecondary,
      activeTrackColor: context.appColors.colorSecondary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kMarginMedium_2), side: BorderSide.none),
      title: Text(
        title,
        style: context.appFonts.customFont(
          fontSize: FontSize.s14,
          color: context.appColors.colorWhite,
        ),
        textAlign: TextAlign.start,
      ),
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}
