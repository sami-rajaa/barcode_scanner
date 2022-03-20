import 'package:barcode_scanner/config/app_constants.dart';
import 'package:flutter/material.dart';

import 'package:barcode_scanner/Widgets/reuseableButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaisayLiyeDiye extends StatefulWidget {
  const PaisayLiyeDiye({Key? key}) : super(key: key);

  @override
  _PaisayLiyeDiyeState createState() => _PaisayLiyeDiyeState();
}

class _PaisayLiyeDiyeState extends State<PaisayLiyeDiye> {
  // final _firestore = FirebaseFirestore.instance;
  DateTime date = DateTime.now();
  late var formattedDate = DateFormat('d-MMM-yy').format(date);
  late String paisayDiye;
  late String paisayLiye;
  late String dateofKhata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Khata"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                paisayDiye = value;
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: "Maine Diye"),
            ),
            TextField(
              onChanged: (value) {
                paisayLiye = value;
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: "Maine Liye"),
            ),
            const SizedBox(
              height: 28.0,
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  label: Text(formattedDate),
                  icon: const Icon(Icons.date_range_outlined),
                  onPressed: () async {
                    DateTime? _newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030),
                    );
                    setState(() {
                      if (_newDate == null) {
                        return;
                      } else {
                        formattedDate = DateFormat('d-MMM-yy').format(_newDate);
                      }
                    });
                  },
                ),
                const Spacer(),
                // ReusableButton(text: "Add bills"),
              ],
            ),
            const Spacer(),
            ReusableButton(
              color: Colors.green,
              text: 'Save',
              onpress: () async {
                await firestore.collection('CUSTOMERKHATA').add(
                  {
                    'DIYE': paisayDiye,
                    'LIYE': paisayLiye,
                    'DATE': formattedDate
                  },
                );
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
