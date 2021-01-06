import 'package:FlutterWikipedia/domain/entities/currency_detail.dart';
import 'package:FlutterWikipedia/domain/repo/currency_repo.dart';

class GetCurrencyDetailUseCase {
  final CurrencyRepo _currencyRepo;
  GetCurrencyDetailUseCase(this._currencyRepo);

  Future<CurrencyDetail> execute(String currency){
    return _currencyRepo.getCurrencyDetail(currency);
  }
}