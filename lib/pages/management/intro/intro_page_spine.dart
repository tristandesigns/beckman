import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPageTools {
  static String firstName;
  static String lastName;
  static int age;

  static FloatingActionButton getFloatingActionButton(BuildContext context, Icon icon, String text, Widget nextPage, Function onPressed) {
    return FloatingActionButton.extended(
      icon: icon,
      label: Text(text),
      onPressed: () {
        if (onPressed != null) {
          onPressed();
          return;
        }
        Navigator.of(context).push(CupertinoPageRoute(builder: (context) => nextPage));
      },
    );
  }

  static BottomAppBar getBottomAppBar(BuildContext context, bool goToLastPage) {
    return BottomAppBar(
      elevation: 0,
      shape: AutomaticNotchedShape(RoundedRectangleBorder(), StadiumBorder()),
      color: Colors.grey[800].withAlpha(70),
      notchMargin: 8,
      child: Row(
        children: [
          !goToLastPage ? FlatButton(onPressed: null, child: null,) : IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}