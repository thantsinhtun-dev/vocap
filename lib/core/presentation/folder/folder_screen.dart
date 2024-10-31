import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vocap/core/constants/app_colors.dart';
import 'package:vocap/core/constants/app_fonts.dart';
import 'package:vocap/core/constants/app_images.dart';
import 'package:vocap/core/constants/dimens.dart';
import 'package:vocap/core/presentation/create_note/create_note_screen.dart';
import 'package:vocap/core/presentation/folder_detail/folder_detail_screen.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key, required this.scrollController});

  final ScrollController scrollController;
  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  // final ScrollController _scrollController = ScrollController();
  // bool fabIsVisible = true;
  List<String> list = [
    "helel",
    "hjk",
    "jkjkj",
    "helel",
    "hjk",
    "jkjkj",
    "helel",
    "hjk",
    "jkjkj",
    "helel",
    "hjk",
    "jkjkj"
  ];
  @override
  void initState() {
    // _scrollController.addListener(() {
    //   setState(() {
    //     fabIsVisible =
    //         _scrollController.position.userScrollDirection == ScrollDirection.forward;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kMarginMedium_2,
          vertical: kMarginMedium_2,
        ),
        child: GridView.builder(
            controller: widget.scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kMarginMedium_2,
              crossAxisSpacing: kMarginMedium_2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2.5),
            ),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: context.appColors.colorGrey,
                  borderRadius: BorderRadius.circular(kMarginLarge),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(kMarginLarge),
                    onTap: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context) => FolderDetailScreen()));

                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.imgFolder),
                        const SizedBox(height: kMarginSmall_3),
                        Text(
                          list[index],
                          style: context.appFonts.customFont(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
