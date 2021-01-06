import 'package:http/http.dart' as http;

class RemoteApi {
  static const String currencyDetailUrl =
      'https://www.bitstamp.net/api/ticker/';
  static const String orderBookUrl = 'https://www.bitstamp.net/api/order_book/';

  Future<dynamic> fetchCurrencyDetail(String currency) async {
    try {
      var result = await http.get('$currencyDetailUrl$currency');
      if (result.statusCode == 200) {
        return result.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> fetchOrderBookDetail(String currency) async{
    try {
      var result = await http.get('$orderBookUrl$currency');
      if (result.statusCode == 200) {
        return result.body;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
