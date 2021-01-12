import 'package:intl/intl.dart';

class Utils {
  static String getStringFromDate(String dateStr){
  final DateFormat formatter = DateFormat('dd MMM yyyy, HH:mm:s');
   return formatter.format(DateTime.fromMicrosecondsSinceEpoch(int.parse(dateStr)));
  }
}