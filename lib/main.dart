import 'package:beckman/pages/management/intro/intro_page_1.dart';
import 'package:beckman/pages/management/intro/intro_page_2.dart';
import 'package:beckman/pages/spine.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) {
        if (brightness == Brightness.dark) return darkTheme;
        return lightTheme;
      },
      themedWidgetBuilder: (BuildContext context, ThemeData themeData) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: themeData,

            // TODO Make this check sharedprefs to see if IntroPage should be instantiated

            home: Spine()
        );
      },
    );
  }
}

var darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

var lightTheme = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);