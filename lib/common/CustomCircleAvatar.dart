import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.white70,
          child: Icon(Icons.account_circle),
        ),
        Text("23.3k"),
      ],
    );
  }
}
