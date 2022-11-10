import 'package:flutter/material.dart';
import 'Widgets/balance_card.dart';
import 'Widgets/button_row.dart';
import 'Widgets/coin_item.dart';
import 'exchange_page.dart';
import 'home_screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  int _currentIndex = 0;

  final tabs = [
    HomePage(),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Wallet'),
    ),
    ExchangePage(),
    Center(
      child: Text('Profile'),
    ),
  ];

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
      body: tabs[_currentIndex],
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
            label: 'wallet',
          ),
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
