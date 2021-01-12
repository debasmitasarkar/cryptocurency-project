import 'package:FlutterWikipedia/domain/entities/order_book_data.dart';

abstract class OrderBookState {}

class OrderBookInitial extends OrderBookState {}

class ViewOrder extends OrderBookState {}

class OrderBookFetching extends OrderBookState {}

class OrderBookFailed extends OrderBookState {}

class OrderBookFetched extends OrderBookState {
  List<OrderBookData> orders;
  OrderBookFetched(this.orders);
}
