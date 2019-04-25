import 'package:flutter/material.dart';
import 'package:flutter_gatjed_poc/src/constants/app_theme.dart';
import 'package:flutter_gatjed_poc/src/features/home/view/home.dart';
import 'package:flutter_gatjed_poc/src/utils/HexColor.dart';

class GatjedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: HexColor(Styles.color_primary),
        primaryColor: HexColor(Styles.color_primary),
        accentColor: HexColor(Styles.color_accent),
        canvasColor: HexColor(Styles.color_background),
        primaryTextTheme: TextTheme(
          display1: TextStyle(
            color: HexColor(Styles.color_primary),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
