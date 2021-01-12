// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => SearchBloc(c<GetCurrencyDetailUseCase>()));
    container.registerFactory((c) => OrderBookBloc(c<GetOrderBookUseCase>()));
    container
        .registerFactory((c) => GetCurrencyDetailUseCase(c<CurrencyRepoImpl>()));
    container.registerFactory((c) => GetOrderBookUseCase(c<CurrencyRepoImpl>()));
    container.registerSingleton((c) => CurrencyRepoImpl(c<RemoteApi>()));
    container.registerFactory((c) => RemoteApi());
  }
}
