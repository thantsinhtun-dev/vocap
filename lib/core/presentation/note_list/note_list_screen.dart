import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vocap/core/constants/app_colors.dart';
import 'package:vocap/core/constants/app_fonts.dart';
import 'package:vocap/core/constants/dimens.dart';
import 'package:vocap/core/presentation/note_details/note_detail_screen.dart';

import '../../constants/app_images.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text(
                "124 Notes",
                style: context.appFonts.customFont(
                  fontSize: FontSize.s12,
                  fontWeight: FontWeight.w500,
                  color: context.appColors.colorAccent,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
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
          )
        ],
      ),
    );
  }
}
