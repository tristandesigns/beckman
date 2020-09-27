import 'package:flutter/material.dart';

class ContactListItem extends StatefulWidget {
  final String firstName, lastName, email;

  ContactListItem(this.firstName, this.lastName, this.email);

  @override
  _ContactListItemState createState() =>
      _ContactListItemState(this.firstName, this.lastName, this.email);
}

class _ContactListItemState extends State<ContactListItem> {
  String firstName, lastName, email;
  _ContactListItemState(this.firstName, this.lastName, this.email);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${this.lastName}, ${this.firstName}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("Teacher")
          ],
        ),
        Divider(),
      ],
    );

    /*Card(
        child: Column(
      children: [
        Text(
          "${this.lastName}, ${this.firstName}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(this.email)
      ],
    ));*/
  }
}