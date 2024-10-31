import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocap/core/constants/app_colors.dart';
import 'package:vocap/core/constants/app_fonts.dart';
import 'package:vocap/core/constants/dimens.dart';

import '../../constants/app_images.dart';
import '../../constants/app_strings.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text(
          AppStrings.lblNote,
          style: context.appFonts.customFont(
              color: context.appColors.colorWhite,
              fontWeight: FontWeight.w700,
              fontSize: FontSize.s18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(AssetImage(AppImages.imgEdit)),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: kMarginMedium_2,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: kMarginMedium_2,
            horizontal: kMarginMedium_2,
          ),
          decoration: BoxDecoration(
            color: context.appColors.colorGrey,
            borderRadius: BorderRadius.circular(kMarginMedium_2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                cursorColor: context.appColors.colorSecondary,
                showCursor: true,
                "NoteBox  ListTile",
                style: context.appFonts.customFont(
                  fontSize: FontSize.s15,
                  fontWeight: FontWeight.w500,
                  color: context.appColors.colorWhite,
                ),
              ),
              const SizedBox(height: kMarginSmall),
              SelectableText(
                cursorColor: context.appColors.colorSecondary,
                showCursor: true,
                "NoteBox  ListTile",
                style: context.appFonts.customFont(
                  fontSize: FontSize.s12,
                  fontWeight: FontWeight.w500,
                  color: context.appColors.colorSecondaryText,
                ),
              ),
              const SizedBox(height: kMarginMedium_2),
              SelectableText(
                "NoteBox  ListTile",
                cursorColor: context.appColors.colorSecondary,
                showCursor: true,
                style: context.appFonts.customFont(
                  fontSize: FontSize.s14,
                  fontWeight: FontWeight.w500,
                  color: context.appColors.colorWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
