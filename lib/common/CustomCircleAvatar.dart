import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double mater;
  const CustomCircleAvatar({
    Key? key,
    required this.mater,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 16.0,
          backgroundColor: Colors.white70,
          child: Icon(Icons.account_circle, size: 30.0),
        ),
        Text(
          "${mater}",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
