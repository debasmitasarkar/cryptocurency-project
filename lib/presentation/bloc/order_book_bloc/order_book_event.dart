import 'package:flutter/material.dart';

abstract class OrderBookEvent{
  String currency;
  OrderBookEvent(this.currency);
}

class ShowInitialEvent extends OrderBookEvent{
  final String currency;
  ShowInitialEvent({this.currency}) : super(null);
}

class ShowViewOrderEvent extends OrderBookEvent{
  final String currency;
  ShowViewOrderEvent({this.currency}) : super(null);
}

class FetchOrderBookEvent extends OrderBookEvent{
  final String currency;
  FetchOrderBookEvent({@required this.currency}) : super(currency);
}