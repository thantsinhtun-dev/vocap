import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:vocap/src/core/app_colors.dart';
import 'package:vocap/src/core/app_fonts.dart';

import '../../../src/core/dimens.dart';
import '../create_note/create_note_screen.dart';

class ChooseFolderScreen extends StatelessWidget {
  const ChooseFolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TouchableOpacity(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return CreateNewFolderSheet();
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginMedium_2),
              child: Text(
                "New Folder",
                style: context.appFonts.customFont(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.w600,
                  color: context.appColors.colorWhite,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return TouchableOpacity(
            onTap: () {},
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kMarginCardMedium),
                child: Text(
                  "Hello $index",
                  style: context.appFonts.customFont(
                    fontWeight: FontWeight.w600,
                    fontSize: FontSize.s16,
                    color: context.appColors.colorWhite,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CreateNewFolderSheet extends StatelessWidget {
  const CreateNewFolderSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: 250,
        child: Column(
          children: [
            const SizedBox(height: kMarginMedium_2),
            const CustomTextField(
              hintText: "hintText",
              padding: EdgeInsets.symmetric(horizontal: kMarginMedium),
              borderRadius: kMarginMedium_2,
            ),
            const SizedBox(height: kMarginMedium_2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kMarginMedium_2),
              child: MaterialButton(
                onPressed: () {},
                color: context.appColors.colorGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kMarginMedium_2),
                ),
                minWidth: double.infinity,
                height: kMarginLargeX_3,
                child: Text(
                  "Create Folder",
                  style: context.appFonts.customFont(
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
