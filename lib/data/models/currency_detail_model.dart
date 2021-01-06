// To parse this JSON data, do
//
//     final currencyDetailModel = currencyDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:FlutterWikipedia/domain/entities/currency_detail.dart';

CurrencyDetailModel currencyDetailModelFromJson(String str) =>
    CurrencyDetailModel.fromJson(json.decode(str));

String currencyDetailModelToJson(CurrencyDetailModel data) =>
    json.encode(data.toJson());

CurrencyDetail currencyDetailModelToCurrencyDetail(CurrencyDetailModel data) =>
    CurrencyDetail(
        timeStamp: data?.timestamp,
        high: data?.high,
        last: data?.last,
        low: data?.low,
        open: data?.open.toString(),
        volumn: data?.volume);

class CurrencyDetailModel {
  CurrencyDetailModel({
    this.volume,
    this.last,
    this.timestamp,
    this.bid,
    this.vwap,
    this.high,
    this.low,
    this.ask,
    this.open,
  });

  String volume;
  String last;
  String timestamp;
  String bid;
  String vwap;
  String high;
  String low;
  String ask;
  double open;

  factory CurrencyDetailModel.fromJson(Map<String, dynamic> json) =>
      CurrencyDetailModel(
        volume: json["volume"] == null ? null : json["volume"],
        last: json["last"] == null ? null : json["last"],
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        bid: json["bid"] == null ? null : json["bid"],
        vwap: json["vwap"] == null ? null : json["vwap"],
        high: json["high"] == null ? null : json["high"],
        low: json["low"] == null ? null : json["low"],
        ask: json["ask"] == null ? null : json["ask"],
        open: json["open"] == null ? null : json["open"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "volume": volume == null ? null : volume,
        "last": last == null ? null : last,
        "timestamp": timestamp == null ? null : timestamp,
        "bid": bid == null ? null : bid,
        "vwap": vwap == null ? null : vwap,
        "high": high == null ? null : high,
        "low": low == null ? null : low,
        "ask": ask == null ? null : ask,
        "open": open == null ? null : open,
      };
}
