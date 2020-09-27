import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

final Map<String, String> contacts = {};

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();

  static Future<Text> scraping() async {
    final webScraper = WebScraper('https://www.tustin.k12.ca.us');
    if (await webScraper.loadWebPage('/beckman/staff/teachers')) {
      List<Map<String, dynamic>> elements =
          webScraper.getElement('td.xl24', []);

      return(Text("$elements"));
    }
    else{
      return(Text("TEst"));
    }
  }
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: FutureBuilder(
        future: ContactsPage.scraping(),
        builder: (_, snapshot) {
          return(snapshot.hasData ? snapshot.data : Container());
        },
      )),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

final Map<String, String> contacts = {};

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final webScraper = WebScraper('https://www.tustin.k12.ca.us');

  List<Map<String, dynamic>> elements;

  void fetchContacts() async {
    if (await webScraper.loadWebPage('/beckman/staff/teachers')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        elements = webScraper.getElement('td.xl24', []);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts
    fetchContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: elements == null ? Container() : Text("$elements"),
      ),
    );
  }
}

 */