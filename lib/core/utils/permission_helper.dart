import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  const PermissionHelper._();

  static Future<void> requestPermissionStorage({
    required Function() onGranted,
    required Function() onDenied,
  }) async {
    try {
      final status = await Permission.storage.request();
      if (status.isGranted) {
        onGranted();
      } else {
        onDenied();
      }
    } catch (e) {
      log('$e');
    }
  }

  static Future<void> requestPermissionCamera({
    required Function() onGranted,
    required Function() onDenied,
  }) async {
    try {
      final status = await Permission.camera.request();
      if (status.isGranted) {
        onGranted();
      } else {
        onDenied();
      }
    } catch (e) {
      log('$e');
    }
  }

  static Future<void> requestPermissionLocation({
    required Function() onGranted,
    required Function() onDenied,
  }) async {
    try {
      final isGranted = await Permission.location.isGranted;
      final whenInUseGranted = await Permission.locationWhenInUse.isGranted;
      final isPermanentlyDenied = await Permission.location.isPermanentlyDenied;

      if (isPermanentlyDenied) {
        await openAppSettings();
      }

      if (isGranted || whenInUseGranted) {
        onGranted();
      } else {
        final status = await Permission.location.request();

        if (status.isGranted || status.isLimited) {
          onGranted();
        } else {
          onDenied();
        }
      }
    } catch (e) {
      onDenied();
    }
  }

  static Future<void> requestPermissionNotification({
    required Function() onGranted,
    required Function() onDenied,
  }) async {
    try {
      final status = await Permission.notification.request();
      if (status.isGranted) {
        onGranted();
      } else {
        onDenied();
      }
    } catch (e) {
      log('$e');
    }
  }
}
