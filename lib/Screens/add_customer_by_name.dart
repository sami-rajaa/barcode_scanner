import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Widgets/reuseableButton.dart';

class AddCustomerByName extends StatefulWidget {
  const AddCustomerByName({Key? key}) : super(key: key);

  @override
  _AddCustomerByNameState createState() => _AddCustomerByNameState();
}

class _AddCustomerByNameState extends State<AddCustomerByName> {
  final _firestore = FirebaseFirestore.instance;
  late String customerName;
  late String custommerContact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  onChanged: (value) {
                    customerName = value;
                  },
                  decoration: const InputDecoration(
                      labelText: "Add Customer's name",
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                TextField(
                  onChanged: (value) {
                    custommerContact = value;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: "Add Customer's contact No (optional)",
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
                const Spacer(),
                ReusableButton(
                  text: 'Next',
                  onpress: () {
                    _firestore.collection('ADDCUSTOMERCONTACTS').add({
                      'CUSTOMERNAME': customerName,
                      'CUSTOMERCONTACT': custommerContact,
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
