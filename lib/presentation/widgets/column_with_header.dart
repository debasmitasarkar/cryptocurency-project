import 'package:flutter/material.dart';
import 'package:FlutterWikipedia/presentation/theme/theme_text.dart';

class ColumnWithHeader extends StatelessWidget {
  final String header;
  final String value;
  ColumnWithHeader({
    @required this.header,
    @required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header, style: Theme.of(context).textTheme.smallBoldText),
          Text(value, style: Theme.of(context).textTheme.regularBoldText),
        ],
      ),
    );
  }
}
