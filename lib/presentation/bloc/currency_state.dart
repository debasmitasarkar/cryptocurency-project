import 'package:FlutterWikipedia/domain/entities/currency_detail.dart';
import 'package:FlutterWikipedia/domain/entities/order_book_data.dart';

abstract class CurrencyState{}

class CurrencyInitial extends CurrencyState{}

class CurrencyDetailFetched extends CurrencyState{
  CurrencyDetail currencyDetail;
  CurrencyDetailFetched(this.currencyDetail);
}

class CurrencyDetailError extends CurrencyState{}

class CurrencyOrderBookError extends CurrencyState{}

class CurrencyOrderBookFetched extends CurrencyState{
  List<OrderBookData> orders;
  CurrencyOrderBookFetched(this.orders);
}