import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vocap/src/core/app_colors.dart';
import 'package:vocap/src/core/app_fonts.dart';
import 'package:vocap/src/core/dimens.dart';
import 'package:vocap/src/extensions/ext_dialog.dart';
import 'package:vocap/src/routes/app_route_data.dart';

import '../../../../domain/entities/user/user_entity.dart';
import '../provider/profile_provider.dart';
import '../provider/profile_state.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profileState = ref.watch(profileControllerProvider);
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
      body: switch (profileState) {
        ProfileInitialState() => const Center(child: CircularProgressIndicator()),
        ProfileLoadingState() => const Center(child: CircularProgressIndicator()),
        ProfileSuccessState() => ProfileDataWidget(userEntity: profileState.userEntity),
      },
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

class ProfileDataWidget extends ConsumerWidget {
  const ProfileDataWidget({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 64,
            backgroundColor: context.appColors.colorAccent,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: CachedNetworkImageProvider(userEntity.image),
            ),
          ),
          const SizedBox(height: kMarginMedium),
          Text(
            userEntity.name,
            style: context.appFonts.customFont(
              fontSize: FontSize.s18,
              color: context.appColors.colorWhite,
            ),
          ),
          Text(
            userEntity.email,
            style: context.appFonts.customFont(
              fontSize: FontSize.s12,
              color: context.appColors.colorAccent,
            ),
          ),
          const SizedBox(height: kMarginMedium),
          SettingSettings(userEntity: userEntity),
          PrimaryButton(
            title: 'Clear All Data',
            textColor: context.appColors.colorWhite,
            bgColor: context.appColors.colorRed,
            padding: const EdgeInsets.symmetric(
              horizontal: kMarginMedium_2,
              vertical: kMarginMedium_2,
            ),
            onPressed: () {

            },
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kMarginMedium_2),
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
            onPressed: () {
              context.showLoading();
              var profile = ref.read(profileControllerProvider.notifier);
              profile.logout(
                onSuccess: (msg) {
                  context.hideLoading();
                  LoginRoute().pushReplacement(context);
                },
                onFailure: (title, msg) {
                  context.hideLoading();
                  context.showSnackBar(title: title, msg: msg);
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class SettingSettings extends ConsumerWidget {
  const SettingSettings({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          SettingSwitchListTile(
            title: "English",
            track: userEntity.autoSync,
            onChange: (value) {
              userEntity.autoSync = value;
              ref.read(profileControllerProvider.notifier).updateUserInfo(userEntity);
            },
          ),
          const SizedBox(height: kMarginCardMedium),
          SettingSwitchListTile(
            title: "Dark Mode",
            track: userEntity.isDarkMode,
            onChange: (value) {
              userEntity.isDarkMode = value;
              ref.read(profileControllerProvider.notifier).updateUserInfo(userEntity);
            },
          ),
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
      padding: padding ?? const EdgeInsets.symmetric(horizontal: kMarginMedium_2),
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
            color: textColor ?? context.appColors.colorWhite,
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
