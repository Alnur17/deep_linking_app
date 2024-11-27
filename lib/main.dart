import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      onInit: () async {
        await _handleInitialLink();
      },
    ),
  );
}

Future<void> _handleInitialLink() async {
  // Set up AppLinks to handle deep links
  final AppLinks appLinks = AppLinks();

  // Get the initial deep link when the app launches
  final Uri? initialLink = await appLinks.getInitialLink();

  if (initialLink != null) {
    _navigateBasedOnLink(initialLink.toString());
  } else {
    // No deep link present, navigate to the Home page
    Get.offAllNamed(Routes.HOME);
  }

  // Listen for deep links while the app is running
  appLinks.uriLinkStream.listen((Uri? uri) {
    if (uri != null) {
      _navigateBasedOnLink(uri.toString());
    }
  });
}

void _navigateBasedOnLink(String link) {
  final Uri uri = Uri.parse(link);
  final referId = uri.queryParameters['refId'];

  if (referId != null) {
    Get.offAllNamed(
      Routes.PROFILE,
      parameters: {'refId': referId},
    );
  } else {
    Get.offAllNamed(
      Routes.PROFILE,
      parameters: {'refId': 'Error: refId is missing'},
    );
  }
}
