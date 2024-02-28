import 'package:cafe_app/core/di/locator.dart' as di;
import 'package:flutter/material.dart';

abstract final class SetupPreferences {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    di.configureDependencies();
  }
}
