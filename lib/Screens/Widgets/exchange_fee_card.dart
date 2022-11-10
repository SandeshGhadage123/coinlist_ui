import 'package:flutter/material.dart';

class ExchangeFeeCard extends StatelessWidget {
  const ExchangeFeeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.network(
                'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png'),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Exchange Fee',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '0.001%',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '0.27',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' Satoshi',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
