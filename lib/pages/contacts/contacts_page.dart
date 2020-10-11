import 'package:beckman/pages/contacts/contact_list_item.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();

  static Future<Map<String, Map<String, String>>> scrapeStaff() async {
    final webScraper = WebScraper('https://www.tustin.k12.ca.us/beckman/staff');
    Map<String, Map<String, String>> contacts = {};

    if (await webScraper.loadWebPage('/administration')) {
      List<Map<String, dynamic>> adminNames = webScraper.getElement('h3', []);
      List<Map<String, dynamic>> adminEmails =
          webScraper.getElement('strong', []);
      List<Map<String, dynamic>> adminTitles = webScraper.getElement('h4', []);
      for (var i in List.from(adminEmails)) {
        if (!i.toString().contains("@")) adminEmails.remove(i);
      }
      for (var i = 0; i < adminNames.length; i++) {
        if (!contacts.containsKey(adminNames[i]['title'])) {
          List<String> name = (adminNames[i]['title'].split(",")[0]).split(" ");
          contacts["${name[1]}, ${name[0]}"] = {
            'email': adminNames[i]['title'],
            'title': adminTitles[i]['title']
          };
        }
      }
    }

    if (await webScraper.loadWebPage('/counseling')) {
      List<Map<String, dynamic>> counselorNames =
          webScraper.getElement('h3', []);
      List<Map<String, dynamic>> counselorEmails =
          webScraper.getElement('strong', []);
      for (var i in List.from(counselorEmails)) {
        if (!i.toString().contains("@")) counselorEmails.remove(i);
      }
      for (var i = 0; i < counselorNames.length; i++) {
        if (!contacts.containsKey(counselorNames[i]['title'])) {
          List<String> name =
              (counselorNames[i]['title'].split(",")[0]).split(" ");
          contacts["${name[1]}, ${name[0]}"] = {
            'email': counselorEmails[i]['title'],
            'title': "Counselor"
          };
        }
      }
    }

    if (await webScraper.loadWebPage('/office-staff')) {
      List<Map<String, dynamic>> officeNames = webScraper.getElement('h3', []);
      List<Map<String, dynamic>> officeEmails =
          webScraper.getElement('strong', []);
      List<Map<String, dynamic>> officeTitles = webScraper.getElement('h4', []);
      for (var i in List.from(officeEmails)) {
        if (!i.toString().contains("@")) officeEmails.remove(i);
      }
      for (var i = 0; i < officeNames.length; i++) {
        if (!contacts.containsKey(officeNames[i]['title']) &&
            officeNames[i]['title'] != "TBA") {
          List<String> name =
              (officeNames[i]['title'].split(",")[0]).split(" ");
          String title = officeTitles[i]['title'];
          if (title.contains(" to ")) {
            List<String> titleList = title.split(" ");
            titleList = titleList.sublist(0, titleList.indexOf("to"));
            title = titleList.join(" ");
          }
          contacts["${name[1]}, ${name[0]}"] = {
            'email': officeEmails[i]['title'],
            'title': title
          };
        }
      }
    }

    if (await webScraper.loadWebPage('/athletics-activities')) {
      List<Map<String, dynamic>> athleticsNames =
          webScraper.getElement('h3', []);
      List<Map<String, dynamic>> athleticsEmails =
          webScraper.getElement('strong', []);
      List<Map<String, dynamic>> athleticsTitles =
          webScraper.getElement('h4', []);
      for (var i in List.from(athleticsEmails)) {
        if (!i.toString().contains("@")) athleticsEmails.remove(i);
      }
      for (var i = 0; i < athleticsNames.length; i++) {
        if (!contacts.containsKey(athleticsNames[i]['title'])) {
          List<String> name = athleticsNames[i]['title'].split(" ");
          contacts["${name[1]}, ${name[0]}"] = {
            'email': athleticsEmails[i]['title'],
            'title': athleticsTitles[i]['title']
          };
        }
      }
    }

    if (await webScraper.loadWebPage('/teachers')) {
      List<Map<String, dynamic>> teacherNames =
          webScraper.getElement('td.xl24', []);

      List<Map<String, dynamic>> teacherEmails =
          webScraper.getElement('td.xl25', []);

      for (var i = 0; i < teacherNames.length; i++) {
        if (!contacts.containsKey(teacherNames[i]['title'])) {
          String name = teacherNames[i]['title'];
          name = name.replaceAll("*", "");
          contacts[name] = {
            'email': teacherEmails[i]['title'],
            'title': 'Teacher'
          };
        }
      }
    }
    return contacts;
  }
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ContactsPage.scrapeStaff(),
      builder: (_, staffSnapshot) {
        if (!(staffSnapshot.hasData)) {
          return Center(child: CircularProgressIndicator());
        } else {
          return (ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: staffSnapshot.data.length,
              itemBuilder: (_, index) {
                var staffData = staffSnapshot.data.keys.toList();
                staffData.sort((String a, String b) => a.compareTo(b));
                String firstName = staffData[index].split(', ')[1];
                String lastName = staffData[index].split(', ')[0];
                String email = staffSnapshot.data[staffData[index]]['email'];
                String title = staffSnapshot.data[staffData[index]]['title'];
                print(title);
                return (ContactListItem(firstName, lastName, email, title));
              }));
        }
      },
    ));
  }
}
