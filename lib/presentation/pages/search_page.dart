import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:FlutterWikipedia/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:FlutterWikipedia/presentation/bloc/search_bloc/search_state.dart';
import 'package:FlutterWikipedia/presentation/widgets/search_bar.dart';
import 'package:FlutterWikipedia/presentation/bloc/order_book_bloc/order_book_bloc.dart';
import 'package:FlutterWikipedia/presentation/bloc/order_book_bloc/order_book_state.dart';
import 'package:FlutterWikipedia/presentation/bloc/search_bloc/search_event.dart';
import 'package:FlutterWikipedia/presentation/theme/theme_text.dart';
import 'package:FlutterWikipedia/presentation/bloc/order_book_bloc/order_book_event.dart';
import 'package:FlutterWikipedia/presentation/pages/search_page_constants.dart';
import 'package:FlutterWikipedia/presentation/widgets/currency_detail_widget.dart';
import 'package:FlutterWikipedia/common/injector/injector.dart';
import 'package:FlutterWikipedia/presentation/widgets/order_book_widget.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchBloc _searchBloc = Injector.resolve<SearchBloc>();
  OrderBookBloc _orderBookBloc = Injector.resolve<OrderBookBloc>();

  String searchText = '';

  @override
  void dispose() {
    super.dispose();
    _searchBloc?.close();
    _orderBookBloc?.close();
  }

  _initialSearchWidget() => Column(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 200,
          ),
          SizedBox(height: 20),
          Text(
            SearchPageConstants.searchInitialDesc,
            style: Theme.of(context).textTheme.regularText,
          )
        ],
      );

  CurrencyDetailWidget _currencyDetailWidget(CurrencyDetailFetched state) {
    if (_orderBookBloc.state.runtimeType == OrderBookInitial) {
      _orderBookBloc.add(ShowViewOrderEvent());
    }
    return CurrencyDetailWidget(
      currency: searchText.toUpperCase(),
      currencyDetail: state.currencyDetail,
    );
  }

  Row _initialOrderBookWidget() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
            onPressed: () =>
                _orderBookBloc.add(FetchOrderBookEvent(currency: searchText)),
            child: Text('VIEW ORDER BOOK',
                style: Theme.of(context).textTheme.purpleSmallBoldText),
          )
        ],
      );

  OrderBookWidget _orderBookWidget(OrderBookFetched state) => OrderBookWidget(
        onHide: () => _orderBookBloc.add(ShowViewOrderEvent()),
        orderBookData: state.orders,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              SearchBar(
                initialValue: searchText,
                onSearch: (String value) {
                  searchText = value;
                  _searchBloc
                      .add(FetchCurrencyDetailEvent(currency: searchText));
                },
              ),
              SizedBox(height: 30),
              BlocBuilder<SearchBloc, SearchState>(
                cubit: _searchBloc,
                builder: (BuildContext context, SearchState state) {
                  switch (state.runtimeType) {
                    case SearchInitial:
                      return _initialSearchWidget();
                      break;
                    case CurrencyDetailFetched:
                      return _currencyDetailWidget(state);
                      break;
                    case CurrencyDetailFetching:
                      return Center(child: CircularProgressIndicator());
                      break;
                    case CurrencyDetailError:
                      return _initialSearchWidget();
                      break;
                    default:
                      return _initialSearchWidget();
                      break;
                  }
                },
              ),
              BlocBuilder<OrderBookBloc, OrderBookState>(
                cubit: _orderBookBloc,
                builder: (BuildContext context, OrderBookState state) {
                  switch (state.runtimeType) {
                    case OrderBookInitial:
                      return Container();
                      break;
                    case ViewOrder:
                      return _initialOrderBookWidget();
                      break;
                    case OrderBookFetching:
                      return Center(child: CircularProgressIndicator());
                      break;
                    case OrderBookFetched:
                      return _orderBookWidget(state);
                      break;
                    case OrderBookFailed:
                      return _initialOrderBookWidget();
                      break;
                    default:
                      return _initialOrderBookWidget();
                      break;
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<SearchBloc, SearchState>(
        cubit: _searchBloc,
        builder: (BuildContext context, SearchState state) {
          switch (state.runtimeType) {
            case SearchInitial:
              return Container();
              break;
            case CurrencyDetailFetched:
              return FloatingActionButton(
                  child: Icon(Icons.autorenew),
                  onPressed: () {
                    if (_orderBookBloc.state.runtimeType == OrderBookFetched) {
                      _orderBookBloc
                          .add(FetchOrderBookEvent(currency: searchText));
                    }
                    _searchBloc
                        .add(FetchCurrencyDetailEvent(currency: searchText));
                  });
              break;
            case CurrencyDetailError:
              return Container();
              break;
            default:
              return Container();
              break;
          }
        },
      ),
    );
  }
}
