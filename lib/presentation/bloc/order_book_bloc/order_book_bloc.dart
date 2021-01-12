import 'package:bloc/bloc.dart';

import 'package:FlutterWikipedia/domain/usecases/get_orderbook_usecase.dart';
import 'package:FlutterWikipedia/domain/entities/order_book_data.dart';
import 'package:FlutterWikipedia/presentation/bloc/order_book_bloc/order_book_event.dart';
import 'package:FlutterWikipedia/presentation/bloc/order_book_bloc/order_book_state.dart';

class OrderBookBloc extends Bloc<OrderBookEvent, OrderBookState> {
  GetOrderBookUseCase getOrderBookUseCase;

  OrderBookBloc(this.getOrderBookUseCase) : super(OrderBookInitial());

  @override
  Stream<OrderBookState> mapEventToState(OrderBookEvent event) async* {
    switch (event.runtimeType) {
      case ShowInitialEvent:
        yield* _mapInitialToState(event);
        break;
      case FetchOrderBookEvent:
        yield* _mapOrderBookToState(event);
        break;
      case ShowViewOrderEvent:
        yield* _mapShowOrderToState(event);
        break;
      default:
        yield* _mapShowOrderToState(event);
        break;
    }
  }

  Stream<OrderBookState> _mapInitialToState(ShowInitialEvent event) async* {
    yield OrderBookInitial();
  }

  Stream<OrderBookState> _mapShowOrderToState(ShowViewOrderEvent event) async* {
    yield ViewOrder();
  }

  Stream<OrderBookState> _mapOrderBookToState(
      FetchOrderBookEvent event) async* {
    yield OrderBookFetching();
    try {
      List<OrderBookData> data =
          await getOrderBookUseCase.execute(event.currency);
      yield OrderBookFetched(data);
    } catch (e) {
      yield OrderBookFailed();
    }
  }
}
