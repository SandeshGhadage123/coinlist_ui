import 'package:flutter/material.dart';
import 'exchange_page.dart';
import 'my_wallet.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  int _currentIndex = 0;

  final tabs = [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
    MyWallet(),
    ExchangePage(),
    Center(
      child: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
