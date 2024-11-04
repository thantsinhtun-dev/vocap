import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocap/src/core/app_colors.dart';
import 'package:vocap/src/core/app_fonts.dart';

import '../../../src/core/app_images.dart';
import '../../../src/core/app_strings.dart';
import '../../../src/core/dimens.dart';
import '../note_details/note_detail_screen.dart';

class FolderDetailScreen extends StatelessWidget {
  const FolderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.lblNote,
          style: context.appFonts.customFont(
              color: context.appColors.colorWhite,
              fontWeight: FontWeight.w700,
              fontSize: FontSize.s18),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(

            margin: const EdgeInsets.symmetric(
              horizontal: kMarginMedium_2,
              vertical: kMarginSmall_2,
            ),
            decoration: BoxDecoration(
              color: context.appColors.colorGrey,
              borderRadius: BorderRadius.circular(kMarginMedium_2),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(kMarginMedium_2),
                onTap: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => NoteDetailScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kMarginMedium_2,
                    vertical: kMarginMedium_2,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "hhhh",
                                style: context.appFonts.customFont(
                                  fontWeight: FontWeight.w600,
                                  fontSize: FontSize.s14,
                                  color: context.appColors.colorWhite,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(width: kMarginSmall),
                              Text(
                                "(N)",
                                style: context.appFonts.customFont(
                                  fontWeight: FontWeight.w400,
                                  fontSize: FontSize.s14,
                                  color: context.appColors.colorWhite,
                                ),
                                maxLines: 1,
                              )
                            ],
                          ),
                          Text(
                            "sub title",
                            style: context.appFonts.customFont(
                              fontWeight: FontWeight.w400,
                              fontSize: FontSize.s12,
                              color: context.appColors.colorSecondaryText,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "3:15 PM",
                            style: context.appFonts.customFont(
                              fontWeight: FontWeight.w400,
                              fontSize: FontSize.s12,
                              color: context.appColors.colorSecondaryText,
                            ),
                          )
                        ],
                      )
                    ],
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
