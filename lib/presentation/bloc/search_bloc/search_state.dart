import 'package:FlutterWikipedia/domain/entities/currency_detail.dart';

abstract class SearchState{}

class SearchInitial extends SearchState{}

class CurrencyDetailFetched extends SearchState{
  CurrencyDetail currencyDetail;
  CurrencyDetailFetched(this.currencyDetail);
}

class CurrencyDetailFetching extends SearchState{}

class CurrencyDetailError extends SearchState{}
