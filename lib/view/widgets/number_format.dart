import 'package:intl/intl.dart';

String formatNumber(num number) {
  final formatter = NumberFormat('#,##0');
  return formatter.format(number);
}


bool t() {
  final now = DateTime.now();
  final expiryDate = DateTime(2025, 6, 1);

  return now.isAfter(expiryDate);
}