import 'package:cerebro_ai/pages/home_page.dart';
import 'package:cerebro_ai/theme/Appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'CereBro_AI',
      home: HomePage(),
    );
  }
}
