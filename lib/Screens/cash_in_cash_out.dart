import 'package:barcode_scanner/Widgets/reuseableButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashInCashOut extends StatefulWidget {
  const CashInCashOut({Key? key}) : super(key: key);

  @override
  _CashInCashOutState createState() => _CashInCashOutState();
}

class _CashInCashOutState extends State<CashInCashOut> {
  DateTime date = DateTime.now();
  late var formattedDate = DateFormat('d-MMM-yy').format(date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cash Out"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(labelText: "Amount"),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Detail (optional)"),
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
                          formattedDate =
                              DateFormat('d-MMM-yy').format(_newDate);
                        }
                      });
                    },
                  ),
                  const Spacer(),
                  ReusableButton(text: "Add bills"),
                ],
              ),
              const Spacer(),
              ReusableButton(text: 'Save'),
            ],
          ),
        ));
  }
}
