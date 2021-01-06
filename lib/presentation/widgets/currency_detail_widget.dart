import 'package:flutter/material.dart';

import 'package:FlutterWikipedia/domain/entities/currency_detail.dart';
import 'package:FlutterWikipedia/presentation/utils.dart';

class CurrencyDetailWidget extends StatelessWidget {
  final String currency;
  final CurrencyDetail currencyDetail;
  CurrencyDetailWidget({this.currency, this.currencyDetail});
  
  Row _getCurrencyHeaderRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(currency.toUpperCase(),
        ),
          Text(Utils.getStringFromDate(currencyDetail.timeStamp))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: [_getCurrencyHeaderRow(), Row(), Row(), Row(), Row()]),
    );
  }
}
