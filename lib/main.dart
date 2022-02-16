import 'package:barcode_scanner/Screens/add_cutomers_contacts.dart';
import 'package:barcode_scanner/Screens/cash_in_cash_out.dart';
import 'package:barcode_scanner/Screens/cashbook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  static const String title = 'Barcode Scanner';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: const CashInCashOut(),
      );
}
