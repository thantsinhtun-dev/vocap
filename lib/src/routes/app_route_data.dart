import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vocap/src/presentation/create_note/create_note_screen.dart';
import 'package:vocap/src/presentation/folder_detail/folder_detail_screen.dart';
import 'package:vocap/src/presentation/home/home_screen.dart';
import 'package:vocap/src/presentation/login/login_screen.dart';
import 'package:vocap/src/presentation/note_details/note_detail_screen.dart';
import 'package:vocap/src/presentation/note_list/note_list_screen.dart';
import 'package:vocap/src/presentation/profile/profile_screen.dart';
import 'package:vocap/src/presentation/search_vocap/search_vocap_screen.dart';
import 'package:vocap/src/presentation/splash/splash_screen.dart';
part 'app_route_data.g.dart';
@TypedGoRoute<SplashRoute>(
  path: '/',
)
class SplashRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@TypedGoRoute<NoteListRoute>(path: '/note-list')
class NoteListRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NoteListScreen();
  }
}

@TypedGoRoute<NoteDetailRoute>(path: '/note-detail')
class NoteDetailRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NoteDetailScreen();
  }
}


@TypedGoRoute<CreateNoteRoute>(path: '/create-note')
class CreateNoteRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreateNoteScreen();
  }
}

@TypedGoRoute<FolderDetailRoute>(path: '/folder-detail')
class FolderDetailRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FolderDetailScreen();
  }
}


@TypedGoRoute<SearchRoute>(path: '/search-note')
class SearchRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchVocapScreen();
  }
}

@TypedGoRoute<ProfileRoute>(path: '/profile')
class ProfileRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileScreen();
  }
}