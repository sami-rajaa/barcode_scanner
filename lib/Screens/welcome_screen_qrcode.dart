import 'package:flutter/material.dart';

class WelcometoQrWorld extends StatelessWidget {
  const WelcometoQrWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 120.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/vector_barcode.jpg'),
              radius: 120,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            'Scan, Pay & Enjoy!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Text(
              'scan products you want to buy at your favorite store and pay by your phone & enjoy happy, friendly Shopping!',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
