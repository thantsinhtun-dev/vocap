import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:vocap/src/core/app_colors.dart';
import 'package:vocap/src/core/app_fonts.dart';
import 'package:vocap/src/core/dimens.dart';

import '../choose_folder/choose_folder_screen.dart';

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
      body:  ListView(
        physics: const PageScrollPhysics(),
        children: const [
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
        ],
      ),
      bottomNavigationBar:             SafeArea(child: Text("23 March 2024 ",textAlign: TextAlign.center,))
      ,
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
        onTapOutside: (_){
          FocusScope.of(context).unfocus();
        },
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
        minLines: 10,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        showCursor: true,
        textInputAction: TextInputAction.unspecified,

        // textInputAction: TextInputAction.,
        onTapOutside: (_){
          FocusScope.of(context).unfocus();
        },
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
