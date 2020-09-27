import 'package:beckman/pages/contacts/contact_list_item.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();

  static Future<Map<String, Map<String, String>>> scrapeTeachers() async {
    final webScraper = WebScraper('https://www.tustin.k12.ca.us/beckman/staff');
    Map<String, Map<String, String>> contacts;
    List<String> fullList;

    if (await webScraper.loadWebPage('/teachers')) {
      List<Map<String, dynamic>> teacherNames = webScraper.getElement('td.xl24', []);

        List<Map<String, dynamic>> teacherEmails =
        webScraper.getElement('td.xl25', []);

        var list = new List<int>.generate(
            teacherNames.length, (i) => i);
        print("before for loop");
        contacts = {};
        for (var i in list) {
          if(!contacts.containsKey(teacherNames[i]['title'])) {
            contacts[teacherNames[i]['title']] = {'email': teacherEmails[i]['title'], 'title': 'Teacher'};
          }
        }
        
        if(await webScraper.loadWebPage('/athletics-activities')) {
          //List<Map<String, dynamic>> adminNames = webScraper.getElement('h3 < div.fsElementContent', []); FOR ADMIN -> NOT WORKING
          List<Map<String, dynamic>> adminEmails = webScraper.getElement('h3 < div.fsElementContent', []);

          //List<Map<String, dynamic>> adminNames = webScraper.getElement('h3 < div.fsElementContent', []);
          print("${adminEmails}");
          return (contacts);
        }


    }
    else {
      return ({});
    }
  }

  static Future<List<Map<String, dynamic>>> scrapeTeacherEmails() async {
    final webScraper = WebScraper('https://www.tustin.k12.ca.us');
    if (await webScraper.loadWebPage('/beckman/staff/teachers')) {
      List<Map<String, dynamic>> elements =
          webScraper.getElement('td.xl25', []);

      return (elements);
    } else {
      return ([]);
    }
  }
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ContactsPage.scrapeTeachers(),
      builder: (_, teacherSnapshot) {
        return (FutureBuilder(
            future: ContactsPage.scrapeTeacherEmails(),
            builder: (_, emailSnapshot) {
              if (!(teacherSnapshot.hasData && emailSnapshot.hasData)) {
                return (Container());
              } else {
                return (ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: teacherSnapshot.data.length,
                    itemBuilder: (_, index) {
                      // String firstName = teachers[index].split(', ')[1];
                      // String lastName = teachers[index].split(', ')[0];
                      // String email = contacts[teachers[index]];
                      return Text(
                          "${teacherSnapshot.data}"); //(ContactListItem(firstName, lastName, email));
                    }));
              }
            }));
      },
    ));
  }
}

/*
import 'package:beckman/pages/contacts/contact_list_item.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();

  static Future<List<Map<String, dynamic>>> scrapeTeachers() async {
    final webScraper = WebScraper('https://www.tustin.k12.ca.us');
    if (await webScraper.loadWebPage('/beckman/staff/teachers')) {
      List<Map<String, dynamic>> elements =
          webScraper.getElement('td.xl24', []);

      return (elements);
    } else {
      return ([]);
    }
  }

  static Future<List<Map<String, dynamic>>> scrapeTeacherEmails() async {
    final webScraper = WebScraper('https://www.tustin.k12.ca.us');
    if (await webScraper.loadWebPage('/beckman/staff/teachers')) {
      List<Map<String, dynamic>> elements =
          webScraper.getElement('td.xl25', []);

      return (elements);
    } else {
      return ([]);
    }
  }
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: ContactsPage.scrapeTeachers(),
      builder: (_, teacherSnapshot) {
        return (FutureBuilder(
            future: ContactsPage.scrapeTeacherEmails(),
            builder: (_, emailSnapshot) {
              if (!(teacherSnapshot.hasData && emailSnapshot.hasData)) {
                return (Container());
              } else {
                var list = new List<int>.generate(
                    teacherSnapshot.data.length, (i) => i);
                var teachers = [];
                var contacts = {};
                for (var i in list) {
                  teachers.add(teacherSnapshot.data[i]['title']);
                  contacts.putIfAbsent(teacherSnapshot.data[i]['title'],
                      () => emailSnapshot.data[i]['title']);
                }
                teachers.sort((a, b) => a.compareTo(b));
                return (ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: teacherSnapshot.data.length,
                    itemBuilder: (_, index) {
                      String firstName = teachers[index].split(', ')[1];
                      String lastName = teachers[index].split(', ')[0];
                      String email = contacts[teachers[index]];
                      return (ContactListItem(firstName, lastName, email));
                    }));
              }
            }));
      },
    ));
  }
}
*/
