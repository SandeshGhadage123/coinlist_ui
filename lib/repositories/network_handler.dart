import 'package:dio/dio.dart';

import '../models/coin_model.dart';

class NetworkHandler {
  final Dio dio = Dio();

  Future<CoinModel?> getDio() async {
    try {
      var response = await dio.get('https://api.coincap.io/v2/assets');
      CoinModel _model = CoinModel.fromJson(response.data);
      return _model;
    } catch (e) {
      print(e);
    }
  }
}
