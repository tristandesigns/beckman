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
        return ThemeData(
          primarySwatch: Colors.indigo,
          brightness: brightness,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        );
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
