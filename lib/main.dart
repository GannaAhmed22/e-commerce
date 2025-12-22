import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/app_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/di/di_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => AppClient(), // Wrap your app
  // );
  runApp(const AppClient());
}

