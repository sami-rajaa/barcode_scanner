import 'package:get/get.dart';

import '../config/app_constants.dart';

class CashController extends GetxController {
  static CashController instance = Get.find();
  var cashInHand = ''.obs;
  var balance = ''.obs;

  fetchCustomer() async {
    var data =
        await firestore.collection('').orderBy('title', descending: true).get();
    // try {
    //   return List.from(data.docs.map((e) => ProductModel.fromSnapshot(e)));
    // } catch (e) {
    //  logger.e(e);
    //   return null;
    // }
  }
}
