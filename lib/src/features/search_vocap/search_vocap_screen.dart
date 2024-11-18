import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vocap/src/core/app_colors.dart';
import 'package:vocap/src/core/app_fonts.dart';

class SearchVocapScreen extends StatelessWidget {
  const SearchVocapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: TextField(
          showCursor: true,
          autocorrect: false,
          cursorColor: context.appColors.colorSecondary,
          autofocus: true,
          maxLines: 1,
          onSubmitted: (value) {
            print("submit $value");
          },
          onChanged: (value) {
            print("value $value");
          },
          style: context.appFonts.customFont(
            fontSize: FontSize.s18,
            fontWeight: FontWeight.w600,
          ),
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.red,
            hintText: "Search",
            hintStyle: context.appFonts.customFont(
              fontSize: FontSize.s16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, _) {
              return Text("jjjj");
            },
          ),
        ],
      ),
    );
  }
}
