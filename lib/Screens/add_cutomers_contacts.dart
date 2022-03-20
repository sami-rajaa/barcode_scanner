import 'package:barcode_scanner/Screens/cashbook.dart';
import 'package:barcode_scanner/Screens/display_contacts_from_directory.dart';
import 'package:barcode_scanner/Widgets/reusable_card.dart';
import 'package:barcode_scanner/model/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Widgets/reuseableButton.dart';
import '../config/app_constants.dart';
import 'customers_loan_give_take.dart';

class AddCustomerContacts extends StatefulWidget {
  const AddCustomerContacts({Key? key}) : super(key: key);

  @override
  _AddCustomerContactsState createState() => _AddCustomerContactsState();
}

class _AddCustomerContactsState extends State<AddCustomerContacts> {
  final _firestore = FirebaseFirestore.instance;

  Color? _inactiveColorfor_tobegiven = Colors.red[100];
  Color? _inactiveTextColorfor_tobegiven = Colors.red;
  Color? _inactiveColorfor_tobereceived = Colors.green[100];
  Color? _inactiveTextColorfor_tobereceived = Colors.green;

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    CaShBookRegister(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _inactiveColorfor_tobegiven =
                              _inactiveColorfor_tobegiven == Colors.red
                                  ? Colors.red[100]
                                  : Colors.red;
                          _inactiveTextColorfor_tobegiven =
                              _inactiveTextColorfor_tobegiven == Colors.white
                                  ? Colors.red
                                  : Colors.white;
                          _inactiveColorfor_tobereceived = Colors.green[100];
                          _inactiveTextColorfor_tobereceived = Colors.green;
                        });
                      },
                      child: ReuseableCard(
                        textcolour: (_inactiveTextColorfor_tobegiven)!,
                        buttonColour: (_inactiveColorfor_tobegiven)!,
                        text: "To be given",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _inactiveColorfor_tobereceived =
                                _inactiveColorfor_tobereceived == Colors.green
                                    ? Colors.green[100]
                                    : Colors.green;

                            _inactiveTextColorfor_tobereceived =
                                _inactiveTextColorfor_tobereceived ==
                                        Colors.white
                                    ? Colors.green
                                    : Colors.white;

                            _inactiveColorfor_tobegiven = Colors.red[100];
                            _inactiveTextColorfor_tobegiven = Colors.red;
                          });
                        },
                        child: ReuseableCard(
                          buttonColour: (_inactiveColorfor_tobereceived)!,
                          textcolour: (_inactiveTextColorfor_tobereceived)!,
                          text: "To be received",
                        )),
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: firestore.collection('ADDCUSTOMERCONTACTS').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                if (snapshot.hasData) {
                  var data = snapshot.data!.docs
                      .map((e) => CustomerModel.fromSnapshot(e))
                      .toList();

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: Get.size.height * 0.74,
                          child: ListView(shrinkWrap: true, children: [
                            FittedBox(
                              child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) => ListTile(
                                        title: Text(data[index].name),
                                      )),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ReusableButton(
                                  color: Colors.red,
                                  text: "Liye or Diye",
                                  onpress: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PaisayLiyeDiye(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          _getPermission();
        },
        label: const Text('Add customer'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Khata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Cashbook',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
      ),
    );
  }

  _getPermission() async {
    if (await Permission.contacts.request().isGranted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ContactsPage(),
        ),
      );
    }
  }
}
