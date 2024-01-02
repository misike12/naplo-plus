import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:android_dynamic_icon/android_dynamic_icon.dart';

class AppIconHelper {
  static const _channel = MethodChannel('app_icon');

  static Future<void> setAppIcon(String iconName) async {
    if (Platform.isIOS) {
      // change icon on ios
      try {
        if (await FlutterDynamicIcon.supportsAlternateIcons) {
          await _channel.invokeMethod('changeIcon', iconName);
          // await FlutterDynamicIcon.setApplicationIconBadgeNumber(0); we don't need this rn, but we will
          await FlutterDynamicIcon.setAlternateIconName(iconName);
        }
      } on PlatformException catch (e) {
        if (kDebugMode) {
          print('Failed to change app icon: ${e.message}');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Ha nem megy, hat nem megy');
        }
      }
    } else if (Platform.isAndroid) {
      // change icon on android
      final _androidDynamicIconPlugin = AndroidDynamicIcon();
      await _androidDynamicIconPlugin.changeIcon(
        bundleId: 'hu.refilc.naplo',
        isNewIcon: iconName != 'refilc_default' ? true : false,
        iconName: iconName != 'refilc_default' ? iconName : '',
        iconNames: [
          'refilc_default',
          'refilc_overcomplicated',
          'refilc_concept',
          'refilc_pride',
        ],
      );
    } else {
      // ha nem megy hát nem megy
    }
  }
}
