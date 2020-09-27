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

  static Future<List<Map<String, dynamic>>> scrapeEmails() async {
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
    final Map<String, String> contacts = {};

    return Scaffold(
        body: Center(
            child: FutureBuilder(
      future: ContactsPage.scrapeTeachers(),
      builder: (_, teacherSnapshot) {
        return (FutureBuilder(
            future: ContactsPage.scrapeEmails(),
            builder: (_, emailSnapshot) {
              var list =
                  new List<int>.generate(teacherSnapshot.data.length, (i) => i);
              var teachers = [];
              var emails = [];
              var contacts = {};
              for (var i in list) {
                teachers.add(teacherSnapshot.data[i]['title']);
                //emails.add(emailSnapshot.data[i]['title']);
                contacts.putIfAbsent(teacherSnapshot.data[i]['title'], () => emailSnapshot.data[i]['title']);
              }
              teachers.sort((a, b) => a.compareTo(b));
              return (ListView.builder(
                  itemCount: teacherSnapshot.data.length,
                  itemBuilder: (_, index) {
                    String firstName = teachers[index].split(', ')[1];
                    String lastName = teachers[index].split(', ')[0];
                    String email = contacts[teachers[index]];
                    // String firstName = teachers[index].split(', ')[1];
                    // String lastName = teachers[index].split(', ')[0];
                    // String email = emails[index];
                    return (ContactListItem(firstName, lastName, email)); //(Text("$email"));
                  }));
            })); //return(snapshot.hasData ? Text("${snapshot.data}") : Container());
      },
    )));
  }
}
