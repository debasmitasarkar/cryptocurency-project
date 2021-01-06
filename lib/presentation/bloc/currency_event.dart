import 'package:flutter/material.dart';

abstract class CurrencyEvent{
  String currency;
}

class FetchCurrencyDetailEvent extends CurrencyEvent{
  final String currency;
  FetchCurrencyDetailEvent({@required this.currency});
}

class FetchOrderBookEvent extends CurrencyEvent{
  final String currency;
  FetchOrderBookEvent({@required this.currency});
}