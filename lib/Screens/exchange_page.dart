import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'Widgets/exchange_fee_card.dart';
import 'Widgets/wallet_card.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({Key? key}) : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  List<bool> isSelected = List.generate(2, (index) => false);
  double _currentSliderValue = 1;
  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(
            'Exchange',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: ToggleSwitch(
                      borderWidth: 4,
                      borderColor: [Colors.grey.withOpacity(0.3)],
                      minWidth: 120.0,
                      minHeight: 35.0,
                      fontSize: 16.0,
                      cornerRadius: 25,
                      initialLabelIndex: 1,
                      activeBgColor: [Colors.white],
                      activeFgColor: Colors.blue,
                      inactiveBgColor: Colors.grey[300],
                      inactiveFgColor: Colors.grey[600],
                      totalSwitches: 2,
                      labels: ['Sell', 'Buy'],
                      //customTextStyles: [TextStyle(fontWeight: FontWeight.bold)],
                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  WalletCard(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pay',
                        style: TextStyle(fontSize: 15),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.currency_exchange,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'USD',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '\$ 12,350',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Slider(
                    value: _currentSliderValue,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Receive',
                        style: TextStyle(fontSize: 15),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Image.network(
                                'https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png'),
                          ),
                          // Icon(
                          //   Icons.currency_exchange,
                          //   color: Colors.green,
                          // ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Ethereum',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.menu_outlined,
                        size: 35,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '2',
                        style: TextStyle(fontSize: 27),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ExchangeFeeCard(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _checked,
                        onChanged: (value) {
                          setState(() {
                            _checked = value;
                          });
                        },
                      ),
                      Text('I have read accept the '),
                      Text(
                        'Terms and Conditions',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              Positioned.fill(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: MaterialButton(
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 20),
                        ),
                        color: Colors.black87,
                        height: 50,
                        minWidth: double.infinity,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {}),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
