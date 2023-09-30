import 'package:flutter/material.dart';

enum QrCategory { instagram, twitter, snapchat }

extension QrCategoryExtension on QrCategory {
  String get name {
    switch (this) {
      case QrCategory.instagram:
        return 'Instagram';
      case QrCategory.twitter:
        return 'Twitter';
      case QrCategory.snapchat:
        return 'Snapchat';
    }
  }

  String get imagePath {
    switch (this) {
      case QrCategory.instagram:
        return 'instagram.png';
      case QrCategory.twitter:
        return 'twitter.png';
      case QrCategory.snapchat:
        return 'snapchat.png';
    }
  }

  String get string {
    switch (this) {
      case QrCategory.instagram:
        return 'instagram';
      case QrCategory.twitter:
        return 'twitter';
      case QrCategory.snapchat:
        return 'snapchat';
    }
  }

  Color get buttonColor {
    switch (this) {
      case QrCategory.instagram:
        return const Color(0xFFE2DEFE);
      case QrCategory.twitter:
        return const Color(0xFFF3ECFF);
      case QrCategory.snapchat:
        return const Color(0xFFFFEDE9);
    }
  }

  String get hint {
    switch (this) {
      case QrCategory.instagram:
        return 'Enter your instagram username';
      case QrCategory.twitter:
        return 'Enter your twitter username';
      case QrCategory.snapchat:
        return 'Enter your snapchat username';
    }
  }

  String get prefixUrl {
    switch (this) {
      case QrCategory.instagram:
      case QrCategory.twitter:
      case QrCategory.snapchat:
        return 'https://www.${name.toLowerCase()}.com/';
    }
  }
}
