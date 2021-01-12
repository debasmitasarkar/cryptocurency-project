import 'package:kiwi/kiwi.dart';

import 'package:FlutterWikipedia/presentation/bloc/order_book_bloc/order_book_bloc.dart';
import 'package:FlutterWikipedia/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:FlutterWikipedia/domain/usecases/get_currency_detail_usecase.dart';
import 'package:FlutterWikipedia/domain/usecases/get_orderbook_usecase.dart';
import 'package:FlutterWikipedia/data/repo/currency_repo_impl.dart';
import 'package:FlutterWikipedia/data/api/remote_api.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container;
  static void setup({bool forTest = false}) {
    container = KiwiContainer();
    final injector = _$Injector();
    injector.configure();
  }

  static final resolve = container.resolve;

  @Register.factory(SearchBloc)
  @Register.factory(OrderBookBloc)
  @Register.factory(GetCurrencyDetailUseCase)
  @Register.factory(GetOrderBookUseCase)
  @Register.singleton(CurrencyRepoImpl)
  @Register.factory(RemoteApi)
  void configure();
}
