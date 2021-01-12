import 'package:flutter/material.dart';

import 'package:FlutterWikipedia/presentation/theme/theme_color.dart';
import 'package:FlutterWikipedia/presentation/widgets/common_widget_constants.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final String initialValue;
  SearchBar({@required this.onSearch, this.initialValue = ''});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController textEditingController;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.fromLTRB(15, 8, 0, 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColor.grey,
        ),
        child: TextFormField(
          controller: textEditingController,
          style: Theme.of(context).inputDecorationTheme.hintStyle,
          focusNode: focusNode,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: CommonWidgetConstants.hintSearch,
            hintStyle: TextStyle(color: Colors.grey[600]),
            suffixIcon: IconButton(
              onPressed: () => widget.onSearch(textEditingController.text),
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
}
