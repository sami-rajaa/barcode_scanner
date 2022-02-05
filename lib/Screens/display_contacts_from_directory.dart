import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  Iterable<Contact?> _contacts = [];

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  Future<void> getContacts() async {
    //Make sure we already have permissions for contacts when we get to this
    //page, so we can just retrieve it
    final Iterable<Contact> contacts = await ContactsService.getContacts(
      withThumbnails: false,
      photoHighResolution: false,
    );
    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (const Text('Contacts')),
      ),
      body: _contacts != null
          //Build a list view of all contacts, displaying their avatar and

          // display name
          ? ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (BuildContext context, int index) {
                Contact? contact = _contacts.elementAt(index);
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                  leading: CircleAvatar(
                    child: Text(contact!.initials()),
                  ),
                  title: Text(contact.displayName ?? ''),
                  //This can be further expanded to showing contacts detail
                  // onPressed().
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
