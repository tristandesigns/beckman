import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
