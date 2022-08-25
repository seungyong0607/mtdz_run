import 'package:flutter/material.dart';

class ItemDetailInfo extends StatelessWidget {
  const ItemDetailInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          width: 20,
          child: Icon(
            Icons.currency_bitcoin,
            color: Colors.black,
            size: 14,
          ),
        ),
        Text("1"),
        SizedBox(
          width: 20,
          child: Icon(
            Icons.currency_franc,
            color: Colors.black,
            size: 14,
          ),
        ),
        Text("12"),
        SizedBox(
          width: 20,
          child: Icon(
            Icons.currency_pound,
            color: Colors.black,
            size: 14,
          ),
        ),
        Text("6"),
      ],
    );
  }
}
