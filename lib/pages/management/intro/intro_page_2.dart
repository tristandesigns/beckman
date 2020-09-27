import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'intro_page_3.dart';
import 'intro_page_spine.dart';

class IntroPage2 extends StatefulWidget {
  @override
  _IntroPage2State createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int age;

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
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFF4b6cb7),
          Color(0xFF182848),
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
            if (IntroPageTools.age == null || !(IntroPageTools.age >= 9 && IntroPageTools.age <= 12)) return;
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
                            Color(0xFFDA4453),
                            Color(0xFF89216B),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 4,
                            child: Container(
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFff6a00),
                                        Color(0xFFee0979),
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    )),
                                child: Text("Setup",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40))),
                          ),
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
                                  autovalidate: true,
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
                                  autovalidate: true,
                                  controller: _lastName,
                                  validator: validator,
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
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                elevation: 4,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFff6a00),
                                          Color(0xFFee0979),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                  ),
                                  child: DropdownButton(
                                    items: <int>[9, 10, 11, 12].map((value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (age) {
                                      IntroPageTools.age = age;
                                    },
                                    value: IntroPageTools.age,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    style: TextStyle(fontSize: 25),
                                    elevation: 8,
                                    underline: Container(),
                                  ),
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
    );
  }
}
