import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vocap/src/core/app_colors.dart';
import 'package:vocap/src/core/app_fonts.dart';
import 'package:vocap/src/core/app_images.dart';
import 'package:vocap/src/core/app_strings.dart';
import 'package:vocap/src/routes/app_route_data.dart';

import '../folder/folder_screen.dart';
import '../note_list/note_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  bool fabIsVisible = true;

  @override
  void initState() {

    _scrollController.addListener(() {
      setState(() {
        fabIsVisible =
            _scrollController.position.userScrollDirection == ScrollDirection.forward;
      });
    });
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedOpacity(
        opacity: fabIsVisible ? 1 : 0,
        duration: const Duration(milliseconds: 100),
        child: FloatingActionButton(
          onPressed: () {
            CreateNoteRoute().push(context);
          },
          backgroundColor: context.appColors.colorAccent,
          foregroundColor: context.appColors.colorWhite,
          child: Image.asset(
            AppImages.imgAddNote,
            color: context.appColors.colorWhite,
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppStrings.lblNote,
          style: context.appFonts.customFont(
              color: context.appColors.colorWhite,
              fontWeight: FontWeight.w700,
              fontSize: FontSize.s18),
        ),
        actions: [
          IconButton(
            onPressed: () {
              SearchRoute().push(context);
            },
            icon: const ImageIcon(AssetImage(AppImages.imgSearch),color: Colors.white),
          ),
          IconButton(
            onPressed: () {
             ProfileRoute().push(context);
            },
            icon:  const ImageIcon(AssetImage(AppImages.imgProfile),color: Colors.white70,),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          labelColor: context.appColors.colorSecondary,
          unselectedLabelColor: context.appColors.colorWhite,
          labelStyle: context.appFonts.customFont(
            fontWeight: FontWeight.w600,
            fontSize: FontSize.s16,
          ),
          unselectedLabelStyle: context.appFonts.customFont(
            fontWeight: FontWeight.w600,
            fontSize: FontSize.s16,
          ),
          labelPadding: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          indicatorColor: context.appColors.colorSecondary,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: const [
            Tab(text: AppStrings.lblAll,iconMargin: EdgeInsets.zero,),
            Tab(text: AppStrings.lblFolder,iconMargin: EdgeInsets.zero,),
          ],
        ),
        centerTitle: false,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          NoteListScreen(),
          FolderScreen(scrollController: _scrollController),
        ],
      ),
    );
  }
}
