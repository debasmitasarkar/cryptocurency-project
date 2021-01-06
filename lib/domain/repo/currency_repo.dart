import 'package:FlutterWikipedia/domain/entities/currency_detail.dart';
import 'package:FlutterWikipedia/domain/entities/order_book_data.dart';

abstract class CurrencyRepo {
  Future<CurrencyDetail> getCurrencyDetail(String currency);
  Future<List<OrderBookData>> getOrderbook(String currency);
}