import 'package:flutter/material.dart';

import '../Widgets/reuseableButton.dart';

class AddCustomerByName extends StatefulWidget {
  const AddCustomerByName({Key? key}) : super(key: key);

  @override
  _AddCustomerByNameState createState() => _AddCustomerByNameState();
}

class _AddCustomerByNameState extends State<AddCustomerByName> {
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
                const TextField(
                  decoration: InputDecoration(
                      labelText: "Add Customer's name",
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Add Customer's contact No (optional)",
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
                const Spacer(),
                ReusableButton(
                  text: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
