import 'package:bloc/bloc.dart';

import 'package:FlutterWikipedia/domain/usecases/get_currency_detail_usecase.dart';
import 'package:FlutterWikipedia/presentation/bloc/search_bloc/search_event.dart';
import 'package:FlutterWikipedia/presentation/bloc/search_bloc/search_state.dart';
import 'package:FlutterWikipedia/domain/entities/currency_detail.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  GetCurrencyDetailUseCase getCurrencyDetailUseCase ;

  SearchBloc(this.getCurrencyDetailUseCase) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    yield* _mapCurrencyDetailToState(event);
  }

  Stream<SearchState> _mapCurrencyDetailToState(event) async* {
    yield CurrencyDetailFetching();
    try {
      CurrencyDetail data =
          await getCurrencyDetailUseCase.execute(event.currency);
      yield CurrencyDetailFetched(data);
    } catch (e) {
      yield CurrencyDetailError();
    }
  }
}
