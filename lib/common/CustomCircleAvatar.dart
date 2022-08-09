import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.white70,
          child: Icon(Icons.account_circle, size: 40.0),
        ),
        Text("23.3k"),
      ],
    );
  }
}
