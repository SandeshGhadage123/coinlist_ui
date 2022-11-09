import 'package:coinlist_ui/models/coin_model.dart';
import 'package:flutter/material.dart';
import '../repositories/network_handler.dart';
import 'Widgets/balance_card.dart';
import 'Widgets/button_row.dart';
import 'Widgets/coin_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CoinModel? _coinModel;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    _coinModel = (await NetworkHandler().getDio())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  int _currentIndex = 0;

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
            onPressed: () {
              // do something
            },
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
              itemCount: _coinModel?.data?.length ?? 0,
              itemBuilder: (context, currIndex) {
                return CoinItem(
                  coinName: _coinModel?.data?[currIndex].name ?? "",
                  symbol: _coinModel?.data?[currIndex].id ?? "",
                  priceUsd: _coinModel?.data?[currIndex].priceUsd ?? "",
                  changePercent24Hr: _coinModel?.data?[currIndex].changePercent24Hr ?? "",
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              label: 'wallet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment_rounded), label: 'payment'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined), label: 'person'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
