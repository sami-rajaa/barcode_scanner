import 'package:barcode_scanner/Widgets/button_widget.dart';
import 'package:barcode_scanner/Widgets/reuseableButton.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scanner/Widgets/reusable_card.dart';

class CaShBookRegister extends StatefulWidget {
  const CaShBookRegister({Key? key}) : super(key: key);

  @override
  _CaShBookRegisterState createState() => _CaShBookRegisterState();
}

class _CaShBookRegisterState extends State<CaShBookRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                      text: "Cash in hand",
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: ReuseableCard(
                      buttonColour: Colors.red,
                      textcolour: Colors.white,
                      text: "Today's balance",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: const [
                  Text('10th Feb,2021'),
                  Spacer(),
                  Text('Cash in'),
                  Spacer(),
                  Text('Cash out'),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Expanded(
                      child: ReusableButton(
                    text: "Cash out",
                  )),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: ReusableButton(
                      text: "Cash in",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
