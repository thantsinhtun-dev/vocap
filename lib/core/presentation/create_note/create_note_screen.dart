import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:vocap/core/constants/app_colors.dart';
import 'package:vocap/core/constants/app_fonts.dart';
import 'package:vocap/core/constants/dimens.dart';
import 'package:vocap/core/presentation/choose_folder/choose_folder_screen.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TouchableOpacity(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChooseFolderScreen()),
              );
            },
            child: Text(
              "Folder Name <>",
              style: context.appFonts.customFont(
                color: context.appColors.colorAccent,
              ),
            ),
          ),
          TouchableOpacity(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginMedium_2),
              child: Text(
                "Save",
                style: context.appFonts.customFont(
                  color: context.appColors.colorWhite,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        top: false,
        bottom: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: "Vocap Title",
              padding: EdgeInsets.symmetric(horizontal: kMarginMedium_2),
              borderRadius: kMarginMedium,
            ),
            SizedBox(height: kMarginMedium_2),
            CustomTextField(
              hintText: 'Category',
              padding: EdgeInsets.symmetric(horizontal: kMarginMedium_2),
              borderRadius: kMarginMedium,
            ),
            SizedBox(height: kMarginMedium_2),
            CustomTextAreaField(
              hintText: 'Enter your description',
              padding: EdgeInsets.symmetric(horizontal: kMarginMedium_2),
              borderRadius: kMarginMedium,
            ),
            Spacer(),
            Center(child: Text("23 March 2024 "))
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.padding,
    required this.borderRadius,
  });

  final String hintText;
  final EdgeInsets padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        cursorColor: context.appColors.colorWhite,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: context.appColors.colorGrey,
          hintStyle: context.appFonts.customFont(
              fontSize: FontSize.s15,
              fontWeight: FontWeight.w500,
              color: context.appColors.colorSecondaryText),
          hintText: hintText,
        ),
        style: context.appFonts.customFont(
            fontSize: FontSize.s15,
            fontWeight: FontWeight.w500,
            color: context.appColors.colorSecondaryText),
      ),
    );
  }
}

class CustomTextAreaField extends StatelessWidget {
  const CustomTextAreaField({
    super.key,
    required this.hintText,
    required this.padding,
    required this.borderRadius,
  });

  final String hintText;
  final EdgeInsets padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        cursorColor: context.appColors.colorWhite,
        maxLines: 15,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: context.appColors.colorGrey,
          hintStyle: context.appFonts.customFont(
              fontSize: FontSize.s15,
              fontWeight: FontWeight.w500,
              color: context.appColors.colorSecondaryText),
          hintText: hintText,
        ),
        style: context.appFonts.customFont(
            fontSize: FontSize.s15,
            fontWeight: FontWeight.w500,
            color: context.appColors.colorSecondaryText),
      ),
    );
  }
}
