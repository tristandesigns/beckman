
import 'package:beckman/main.dart';
import 'package:beckman/pages/management/intro/intro_page_spine.dart';
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
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFC33764),
                      Color(0xFF1D2671),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white
                      ),
                      width: 100,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlutterLogo(),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    Text("Welcome to", style: TextStyle(fontSize: 30),),
                    Text("Beckmanium", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
