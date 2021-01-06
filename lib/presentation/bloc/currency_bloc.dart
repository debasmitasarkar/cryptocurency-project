import 'package:FlutterWikipedia/domain/entities/currency_detail.dart';
import 'package:FlutterWikipedia/domain/entities/order_book_data.dart';
import 'package:bloc/bloc.dart';

import 'package:FlutterWikipedia/domain/usecases/get_currency_detail_usecase.dart';
import 'package:FlutterWikipedia/domain/usecases/get_orderbook_usecase.dart';
import 'package:FlutterWikipedia/presentation/bloc/currency_event.dart';
import 'package:FlutterWikipedia/presentation/bloc/currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent,CurrencyState>{

  GetCurrencyDetailUseCase getCurrencyDetailUseCase;
  GetOrderBookUseCase getOrderBookUseCase;
  
  CurrencyBloc(initialState,getCurrencyDetailUseCase,getOrderBookUseCase) : super(initialState);

  @override
  Stream<CurrencyState> mapEventToState(CurrencyEvent event) async*{
    switch(event.runtimeType){
      case FetchCurrencyDetailEvent:
      yield* _mapCurrencyDetailToState(event);
      break;
      case FetchOrderBookEvent:
      yield* _mapOrderBookToState(event);
      break;
    }
  }

  Stream<CurrencyState> _mapCurrencyDetailToState(FetchCurrencyDetailEvent event) async*{
    try{
      CurrencyDetail data = await getCurrencyDetailUseCase.execute(event.currency);
      yield CurrencyDetailFetched(data);
    }
    catch(e){
      yield CurrencyDetailError();
    }
  }

  Stream<CurrencyState> _mapOrderBookToState(FetchCurrencyDetailEvent event) async*{
    try{
      List<OrderBookData> data = await getOrderBookUseCase.execute(event.currency);
      yield CurrencyOrderBookFetched(data);
    }
    catch(e){
      yield CurrencyOrderBookError();
    }
  }
  
}