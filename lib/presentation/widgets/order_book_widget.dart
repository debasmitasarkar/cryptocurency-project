import 'package:flutter/material.dart';
import 'package:FlutterWikipedia/domain/entities/order_book_data.dart';

import 'package:FlutterWikipedia/presentation/theme/theme_text.dart';

class OrderBookWidget extends StatelessWidget {
  final List<OrderBookData> orderBookData;
  final Function onHide;

  OrderBookWidget({
    @required this.orderBookData,
    @required this.onHide,
  });

  Padding _getOrderBookRow(OrderBookData data) => Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data.bid),
            Text(data.bidQty),
            Text(data.askQty),
            Text(data.askQty)
          ],
        ),
      );

  List<Widget> _getOrderRows(context) {
    List<Widget> rows = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('BID PRICE',
              style: Theme.of(context).textTheme.smallVeryBoldText),
          Text('QTY', style: Theme.of(context).textTheme.smallVeryBoldText),
          Text('QTY', style: Theme.of(context).textTheme.smallVeryBoldText),
          Text('ASK PRICE',
              style: Theme.of(context).textTheme.smallVeryBoldText)
        ],
      ),
      SizedBox(height: 15)
    ];
    orderBookData.forEach((data) {
      rows.add(_getOrderBookRow(data));
    });
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: onHide,
                child: Text('HIDE ORDER BOOK',
                    style: Theme.of(context).textTheme.purpleSmallBoldText),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'ORDER BOOK',
            style: Theme.of(context).textTheme.smallBoldText,
          ),
          Card(
            child: Container(
              height: 215,
              padding: EdgeInsets.all(10),
              child: ListView(
                children: _getOrderRows(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
