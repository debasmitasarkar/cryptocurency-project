import 'package:FlutterWikipedia/presentation/widgets/column_with_header.dart';
import 'package:flutter/material.dart';

import 'package:FlutterWikipedia/domain/entities/currency_detail.dart';
import 'package:FlutterWikipedia/presentation/utils.dart';
import 'package:FlutterWikipedia/presentation/theme/theme_text.dart';

class CurrencyDetailWidget extends StatelessWidget {
  final String currency;
  final CurrencyDetail currencyDetail;
  CurrencyDetailWidget({@required this.currency, @required this.currencyDetail});

  Row _getCurrencyHeaderRow(context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currency.toUpperCase(),
            style: Theme.of(context).textTheme.boldText,
          ),
          Text(Utils.getStringFromDate(currencyDetail.timeStamp))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        _getCurrencyHeaderRow(context),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ColumnWithHeader(
                header: 'OPEN', value: '\$' '${currencyDetail.open}'),
            ColumnWithHeader(
                header: 'HIGH', value: '\$' '${currencyDetail.high}')
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ColumnWithHeader(
                header: 'LOW', value: '\$' '${currencyDetail.low}'),
            ColumnWithHeader(
                header: 'LAST', value: '\$' '${currencyDetail.last}')
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ColumnWithHeader(header: 'VOLUME', value: currencyDetail.volumn),
          ],
        ),
        SizedBox(height: 30),
      ]),
    );
  }
}
