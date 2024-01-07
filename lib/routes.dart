import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_structure/pages/StateNotifierProvider_page/stateNotifierProvider_view.dart';
import 'package:riverpod_structure/pages/family_modifier/family_modifier_view.dart';
import 'package:riverpod_structure/pages/home.dart';
import 'package:riverpod_structure/pages/StateProvider_page/stateProvider_view.dart';
import 'package:riverpod_structure/pages/uploads/upload_page.dart';
import 'pages/page_data/page_data_view.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoute {
  home,
  pageData,
  uploadPage,
  stateProviderPage,
  stateNotifierProviderPage,
  familyModifierPage,
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key,
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/page_data',
        name: AppRoute.pageData.name,
        builder: (context, state) {
          return const DataScreen();
        },
      ),
      GoRoute(
        path: '/uploadPage',
        name: AppRoute.uploadPage.name,
        builder: (context, state) {
          return const UploadPage();
        },
      ),
      GoRoute(
        path: '/stateProviderPage',
        name: AppRoute.stateProviderPage.name,
        builder: (context, state) {
          return const StateNotifierView();
        },
      ),
      GoRoute(
        path: '/stateNotifierProviderPage',
        name: AppRoute.stateNotifierProviderPage.name,
        builder: (context, state) {
          return const StateNotifierProviderView();
        },
      ),
      GoRoute(
        path: '/FamilyModifierPage',
        name: AppRoute.familyModifierPage.name,
        builder: (context, state) {
          return const FamilyModifierView();
        },
      ),
    ],
  );
});
