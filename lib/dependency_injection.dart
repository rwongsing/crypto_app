import 'package:crypto_app/data/crypto_data.dart';
import 'package:crypto_app/data/crypto_data_mock.dart';
import 'package:crypto_app/data/crypto_data_prod.dart';

enum Flavor { MOCK, PROD }

class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  CryptoRepository get cryptoRepository {
    return new ProdCryptoRepository();
  }
}