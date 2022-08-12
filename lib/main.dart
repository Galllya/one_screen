import 'package:flutter/material.dart';
import 'package:one_screen_test/common/ui/color.dart';
import 'package:one_screen_test/pages/home/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.baseBackground,
      ),
      home: const HomePage(),
    );
  }
}
