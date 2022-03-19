import 'package:barcode_scanner/Screens/add_customer_by_name.dart';
import 'package:barcode_scanner/Screens/add_customer_records.dart';
import 'package:barcode_scanner/Screens/add_cutomers_contacts.dart';
import 'package:barcode_scanner/Screens/cash_inCash_out.dart';
import 'package:barcode_scanner/Screens/cashbook.dart';
import 'package:barcode_scanner/Screens/display_contacts_from_directory.dart';
import 'package:barcode_scanner/controller/cash_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller/khataController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp().then((value) {
    // Get.put(CashController());
    // Get.put(KhataController());
  });

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  static const String title = 'Barcode Scanner';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: const AddCustomerRecords(),
      );
}
