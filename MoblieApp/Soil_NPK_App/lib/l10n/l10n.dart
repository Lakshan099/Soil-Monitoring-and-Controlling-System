import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('si'),
    const Locale('ta'),
    const Locale('zh'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'si':
        return 'සිංහල';
      case 'ta':
        return 'தமிழ்';
      case 'zh':
        return '中国人';
      default:
        return 'English';
    }
  }
}
