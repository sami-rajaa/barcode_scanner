import 'package:barcode_scanner/controller/cash_controller.dart';
import 'package:barcode_scanner/controller/khataController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

// CashController cashController = CashController.instance;
// KhataController khataController = KhataController.instance;
final firestore = FirebaseFirestore.instance;
