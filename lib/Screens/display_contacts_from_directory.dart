import 'package:barcode_scanner/Screens/add_customer_by_name.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts = [];
  List<Contact> _contactsFiltered = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    getContacts();
    super.initState();

    searchController.addListener(() {
      filterContacts();
    });
  }

  Future<void> getContacts() async {
    final List<Contact> contacts = await ContactsService.getContacts(
      withThumbnails: false,
      photoHighResolution: false,
    );
    setState(() {
      _contacts = contacts;
    });
  }

  filterContacts() {
    List<Contact> _results = [];
    _results.addAll(_contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();

        String contactName = contact.displayName!.toLowerCase();

        return contactName.contains(searchTerm);
      });
      setState(() {
        _contactsFiltered = _contacts;
      });
    }
    if (searchController.text.isEmpty) {
      setState(() {
        _contactsFiltered = _contacts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;

    return Scaffold(
        appBar: AppBar(
          title: (const Text('Contacts')),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: filterContacts(),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(
                      Icons.close,
                    ),
                    hintText: 'Search Customer',
                  ),
                ),
              ),
              const SizedBox(
                height: 6.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddCustomerByName(),
                      ),
                    );
                  },
                  child: const Text(
                    "  + Add new Customer",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: isSearching == true
                      ? _contactsFiltered.length
                      : _contacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    Contact? contact = isSearching == true
                        ? _contactsFiltered[index]
                        : _contacts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(contact.initials()),
                      ),
                      title: Text(contact.displayName ?? ''),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
