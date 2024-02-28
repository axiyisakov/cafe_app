import 'package:cafe_app/core/util/setup.dart';
import 'package:cafe_app/feautures/presentation/pages/main/main_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  await SetupPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
