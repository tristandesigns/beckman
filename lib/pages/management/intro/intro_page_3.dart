import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../spine.dart';
import 'intro_page_spine.dart';

class IntroPage3 extends StatefulWidget {
  @override
  _IntroPage3State createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: IntroPageTools.getFloatingActionButton(
          context, Icon(Icons.arrow_forward), "Next", Spine(), () {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context)
            .pushReplacement(CupertinoPageRoute(builder: (context) => Spine()));
      }),
      bottomNavigationBar: IntroPageTools.getBottomAppBar(context, true),
      body: Text("classes"),
    );
  }
}
