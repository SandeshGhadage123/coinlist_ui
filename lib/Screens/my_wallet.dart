import 'package:coinlist_ui/models/coin_model.dart';
import 'package:coinlist_ui/repositories/network_handler.dart';
import 'package:flutter/material.dart';
import 'Widgets/balance_card.dart';
import 'Widgets/button_row.dart';
import 'Widgets/coin_item.dart';
import 'package:intl/intl.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  CoinModel? coinModel;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    coinModel = (await NetworkHandler().getDio())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Wallet',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.qr_code_scanner_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          const VerticalDivider(
            width: 5,
            thickness: 1,
            indent: 15,
            endIndent: 10,
            color: Colors.grey,
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const BalanceCard(),
            const SizedBox(
              height: 20,
            ),
            const ButtonRow(),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Live Prices',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: coinModel?.data?.length ?? 0,
              itemBuilder: (context, currIndex) {
                return CoinItem(
                  coinName: coinModel?.data?[currIndex].name ?? "0",
                  symbol: coinModel?.data?[currIndex].symbol ?? "0",
                  priceUsd: NumberFormat.compactSimpleCurrency(locale: 'en-US')
                      .format(double.parse(
                          coinModel?.data?[currIndex].marketCapUsd ?? '0')),
                  changePercent24Hr: coinModel
                          ?.data?[currIndex].changePercent24Hr
                          ?.substring(0, 5) ??
                      "0",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
