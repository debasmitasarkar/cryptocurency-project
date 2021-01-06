import 'package:FlutterWikipedia/domain/entities/order_book_data.dart';
import 'package:FlutterWikipedia/domain/repo/currency_repo.dart';

class GetOrderBookUseCase {
  final CurrencyRepo _currencyRepo;
  GetOrderBookUseCase(this._currencyRepo);

   Future<List<OrderBookData>> execute(String currency){
    return _currencyRepo.getOrderbook(currency);
  }
}