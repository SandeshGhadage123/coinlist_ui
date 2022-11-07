import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.1), width: 1)),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                elevation: 0,
                child: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.black.withOpacity(0.7),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Withdrawal',
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
            )
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.1), width: 1)),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                elevation: 0,
                child: Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.black.withOpacity(0.7),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Deposit',
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
            )
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.1), width: 1)),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                elevation: 0,
                child: Icon(
                  Icons.arrow_circle_left_outlined,
                  color: Colors.black.withOpacity(0.7),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Receive',
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
            )
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.1), width: 1)),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                elevation: 0,
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.black.withOpacity(0.7),
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Send',
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
            )
          ],
        ),
      ],
    );
  }
}
