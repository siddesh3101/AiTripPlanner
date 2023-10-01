import 'dart:typed_data';

import 'package:coep/pages/pehchan/add_socials.dart';
import 'package:coep/pages/pehchan/social_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case AddSocials.routeName:
        return PageTransition(
          child: const AddSocials(),
          type: PageTransitionType.theme,
        );
      case SocialHomeScreen.routeName:
        return PageTransition(
          child: const SocialHomeScreen(),
          type: PageTransitionType.theme,
        );

      default:
        return null;
    }
  }
}
