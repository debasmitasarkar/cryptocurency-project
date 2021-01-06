import 'package:FlutterWikipedia/data/models/currency_detail_model.dart';
import 'package:FlutterWikipedia/data/models/order_book_model.dart';
import 'package:meta/meta.dart';
import 'package:FlutterWikipedia/data/api/remote_api.dart';
import 'package:FlutterWikipedia/domain/entities/order_book_data.dart';
import 'package:FlutterWikipedia/domain/entities/currency_detail.dart';
import 'package:FlutterWikipedia/domain/repo/currency_repo.dart';

class CurrencyRepoImpl extends CurrencyRepo {
  final RemoteApi remoteApi;
  CurrencyRepoImpl({@required this.remoteApi});
  @override
  Future<CurrencyDetail> getCurrencyDetail(String currency) async {
    final Map<String, dynamic> response =
        await remoteApi.fetchCurrencyDetail(currency);
    return currencyDetailModelToCurrencyDetail(
        CurrencyDetailModel.fromJson(response));
  }

  @override
  Future<List<OrderBookData>> getOrderbook(String currency) async {
    final Map<String, dynamic> response =
        await remoteApi.fetchOrderBookDetail(currency);
    return orderBookModelToOrderBookData(OrderBookModel.fromJson(response));
  }
}
