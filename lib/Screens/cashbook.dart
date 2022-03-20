import 'package:barcode_scanner/Widgets/reuseableButton.dart';

import 'package:flutter/material.dart';
import 'package:barcode_scanner/Widgets/reusable_card.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/app_constants.dart';
import 'daily_cash_inCash_out_shopkeeper.dart';

class CaShBookRegister extends StatefulWidget {
  const CaShBookRegister({Key? key}) : super(key: key);

  @override
  _CaShBookRegisterState createState() => _CaShBookRegisterState();
}

class _CaShBookRegisterState extends State<CaShBookRegister> {
  addMoney(snapshot, String name) {
    int cash = 0;
    for (var item in snapshot.data!.docs) {
      cash += int.parse(item[name]);
    }

    return cash.toString();
  }

  DateTime date = DateTime.now();
  late var formattedDate = DateFormat('d-MMM-yy').format(date);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: StreamBuilder(
        stream: firestore
            .collection('CASHINCASHOUT')
            .orderBy('DATE', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          if (snapshot.hasData) {
            List<DataCell> displayedDataCell = [];
            for (var item in snapshot.data!.docs) {
              displayedDataCell.add(
                DataCell(
                  Text(
                    item['DATE'].toString(),
                  ),
                ),
              );
              displayedDataCell.add(
                DataCell(
                  Text(
                    item['CASHIN'].toString(),
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              );
              displayedDataCell.add(
                DataCell(
                  Text(
                    item['CASHOUT'].toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ReuseableCard(
                              textcolour: Colors.white,
                              buttonColour: Colors.green,
                              text:
                                  "Cash in hand \n ${addMoney(snapshot, 'CASHIN') == '0' ? '' : addMoney(snapshot, 'CASHIN')}"),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: ReuseableCard(
                            buttonColour: Colors.red,
                            textcolour: Colors.white,
                            text:
                                "Today's Balance \n ${addMoney(snapshot, 'CASHOUT') == '0' ? '' : addMoney(snapshot, 'CASHOUT')}",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.size.height * 0.74,
                    child: Scrollbar(
                      thickness: 6.4,
                      interactive: true,
                      trackVisibility: true,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          FittedBox(
                            child: DataTable(
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text(
                                    'Date',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Cash In',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Cash Out',
                                  ),
                                ),
                              ],
                              rows: <DataRow>[
                                for (int i = 0;
                                    i < displayedDataCell.length;
                                    i += 3)
                                  DataRow(cells: [
                                    displayedDataCell[i],
                                    displayedDataCell[i + 1],
                                    displayedDataCell[i + 2]
                                  ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableButton(
                            color: Colors.red,
                            text: "Add Enteries",
                            onpress: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CashInCashOut(),
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
      ),
    );
  }
}
