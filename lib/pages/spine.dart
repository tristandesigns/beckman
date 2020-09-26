import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'agenda/agenda_page.dart';
import 'contacts/contacts_page.dart';
import 'help/help_page.dart';
import 'home/home_page.dart';
import 'management/settings/settings_page.dart';

class Spine extends StatefulWidget {
  @override
  _SpineState createState() => _SpineState();
}

class _SpineState extends State<Spine> {

  int selectedIndex = 0;
  List<Widget> pages = [
    HomePage(),
    AgendaPage(),
    ContactsPage(),
    HelpPage()
  ];

  List<String> names = [
    "Beckmanium",
    "Agenda",
    "Contacts",
    "Help"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(names[selectedIndex]),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(
                  builder: (context) => SettingsPage()
              ));
            },
            tooltip: "Settings",
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.brightness_3),
          onPressed: () => DynamicTheme.of(context).setBrightness(DynamicTheme.of(context).brightness == Brightness.dark ? Brightness.light : Brightness.dark),
          tooltip: "Change Brightness",
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
        },
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            title: Text("Agenda"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("Contacts"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            title: Text("Help"),
          ),
        ],
      ),
    );
  }
}
