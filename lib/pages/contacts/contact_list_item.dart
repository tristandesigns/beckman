import 'package:flutter/material.dart';

class ContactListItem extends StatefulWidget {
  final String firstName, lastName, email, title;

  ContactListItem(this.firstName, this.lastName, this.email, this.title);

  @override
  _ContactListItemState createState() => _ContactListItemState(
      this.firstName, this.lastName, this.email, this.title);
}

class _ContactListItemState extends State<ContactListItem> {
  String firstName, lastName, email, title;
  _ContactListItemState(this.firstName, this.lastName, this.email, this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Text(
                "${this.lastName}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                ", ${this.firstName}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Text("${this.title}"),
        ]),
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
