import 'package:beckman/main.dart';
import 'package:beckman/pages/contacts/contact_list_item.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: contactsList,
      builder: (_, staffSnapshot) {
        if (!(staffSnapshot.hasData)) {
          return Center(child: CircularProgressIndicator());
        }
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
      },
    ));
  }
}
