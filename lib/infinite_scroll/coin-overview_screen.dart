import 'package:coinlist_ui/models/coin_model.dart';
import 'package:flutter/material.dart';

class CoinOverviewScreen extends StatefulWidget {
  const CoinOverviewScreen({Key? key}) : super(key: key);

  @override
  State<CoinOverviewScreen> createState() => _CoinOverviewScreenState();
}

class _CoinOverviewScreenState extends State<CoinOverviewScreen> {

  late bool _isLastcoin;
  late int _coinNumber;
  late bool _error;
  late bool _loading;
  final int _numberOfcoinsPerRequest = 20;
  late List<CoinModel> _coins;
  final int _nextPageTrigger = 5;

  @override
  void initState() {
    super.initState();
    _coinNumber = 0;
    _coins = [];
    _isLastcoin = false;
    _loading = true;
    _error = false;
    //fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
