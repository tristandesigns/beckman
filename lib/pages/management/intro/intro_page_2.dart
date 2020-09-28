import 'package:beckman/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'intro_page_3.dart';
import 'intro_page_spine.dart';

class IntroPage2 extends StatefulWidget {
  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> with SingleTickerProviderStateMixin {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int age;
  AnimationController _controller;
  Animation<Color> _colorTween;

  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 0),
      reverseDuration: Duration(milliseconds: 500)
    );

    _colorTween = ColorTween(
        begin: Colors.grey[800].withOpacity(0.25),
        end: Colors.red.withOpacity(0.5),
    ).animate(_controller)
    ..addListener(() { setState(() { }); });
    super.initState();
  }
  
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String validator(String value) {
      if (value.isEmpty) {
        return "Don't leave this blank!";
      }
      return null;
  }

  @override
  Widget build(BuildContext context) {
    _firstName.text = IntroPageTools.firstName;
    _lastName.text = IntroPageTools.lastName;
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
        )),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            floatingActionButton: IntroPageTools.getFloatingActionButton(
                context, Icon(Icons.arrow_forward), "Next", IntroPage3(), () {
              IntroPageTools.firstName = _firstName.text;
              IntroPageTools.lastName = _lastName.text;
              if (!_formKey.currentState.validate()) return;
              if (IntroPageTools.age == null || !(IntroPageTools.age >= 9 && IntroPageTools.age <= 12)){
                  _controller.forward();
                  _controller.reverse();
                return;
              };
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) => IntroPage3()));
            }),
            bottomNavigationBar: IntroPageTools.getBottomAppBar(context, true),
            backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(
                width: 350,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 8,
                  child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF3E6DB9),
                              Color(0xFF3B537C),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[800].withOpacity(0.25)),
                                child: Text("Setup",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                            Padding(padding: EdgeInsets.all(5)),
                            Text("What is your name?",
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            Padding(padding: EdgeInsets.all(5)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: _firstName,
                                    validator: validator,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (text) {
                                      IntroPageTools.firstName = text;
                                    },
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      labelText: "First Name",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(color: Colors.white)
                                      ),
                                      errorStyle: TextStyle(color: Colors.white),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(color: Colors.white)
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.all(5)),
                                Expanded(
                                  child: TextFormField(
                                    controller: _lastName,
                                    validator: validator,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (String text) {
                                      print(text);
                                    },
                                    onChanged: (text) {
                                      IntroPageTools.lastName = text;
                                    },
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      labelText: "Last Name",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(color: Colors.white)
                                      ),
                                      errorStyle: TextStyle(color: Colors.white),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(color: Colors.white)
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Grade", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                                Padding(padding: EdgeInsets.all(5)),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.white.withOpacity(0.42)),
                                    color: _colorTween.value,
                                  ),
                                  child: DropdownButton(
                                    items: <int>[9, 10, 11, 12].map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (age) {
                                      setState(() => IntroPageTools.age = age);
                                    },
                                    value: IntroPageTools.age,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    style: TextStyle(fontSize: 25),
                                    elevation: 8,
                                    underline: Container(),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
