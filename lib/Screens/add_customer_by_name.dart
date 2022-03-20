import 'package:barcode_scanner/Screens/customers_loan_give_take.dart';
import 'package:barcode_scanner/model/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/reuseableButton.dart';
import '../config/app_constants.dart';

class AddCustomerByName extends StatefulWidget {
  const AddCustomerByName({Key? key}) : super(key: key);

  @override
  _AddCustomerByNameState createState() => _AddCustomerByNameState();
}

class _AddCustomerByNameState extends State<AddCustomerByName> {
  late String customerName;
  late String customerContact;
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
                    customerContact = value;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      labelText: "Add Customer's contact No (optional)",
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
                const Spacer(),
                ReusableButton(
                  text: 'Next',
                  onpress: () async {
                    await firestore.collection('ADDCUSTOMERCONTACTS').add(
                        CustomerModel(
                            name: customerName,
                            phoneNo: customerContact,
                            cashRecords: []).toMap());
                    Get.to(() => PaisayLiyeDiye());
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
