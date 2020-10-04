
import 'package:beckman/main.dart';
import 'package:beckman/pages/management/intro/intro_page_spine.dart';
import 'package:beckman/widgets/welcome_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'intro_page_2.dart';

class IntroPage1 extends StatefulWidget {
  @override
  _IntroPage1State createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0f0c29),
                Color(0xFF302b63),
                Color(0xFF24243e),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
        ),
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: IntroPageTools.getFloatingActionButton(context, Icon(Icons.arrow_forward), "Lets Go", IntroPage2(), null),
          bottomNavigationBar: IntroPageTools.getBottomAppBar(context, false),
          backgroundColor: Colors.transparent,
          body: Center(
            child: WelcomeCard(),
          ),
        ),
      ),
    );
  }
}
