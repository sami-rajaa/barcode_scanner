import 'package:barcode_scanner/Screens/welcome_screen_qrcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/barcode_scanning_screen.dart';
import 'Widgets/button_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Barcode Scanner';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: const Color(0XFFFFF7F6),
        ),
        home: const WelcometoQrWorld(),
      );
}
