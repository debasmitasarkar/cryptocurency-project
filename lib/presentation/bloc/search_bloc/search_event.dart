import 'package:flutter/material.dart';

abstract class SearchEvent{
  String currency;
  SearchEvent(this.currency);
}

class FetchCurrencyDetailEvent extends SearchEvent{
  final String currency;
  FetchCurrencyDetailEvent({@required this.currency}) : super(currency);
}