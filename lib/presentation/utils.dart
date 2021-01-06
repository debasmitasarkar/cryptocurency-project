class Utils {
  static String getStringFromDate(String dateStr){
   return DateTime(int.tryParse(dateStr)).toString();
  }
}