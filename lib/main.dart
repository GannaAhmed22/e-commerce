import 'package:ecommerce/app_client.dart';
import 'package:flutter/material.dart';
import 'core/di/di_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  
  runApp(const AppClient());
}

