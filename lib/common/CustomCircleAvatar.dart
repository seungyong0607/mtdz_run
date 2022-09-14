import 'package:flutter/material.dart';
import 'package:mtdz_run/mypage/MyPage.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/myPage');
            // Navigator.push(context, MyPage());
          },
          child: CircleAvatar(
            radius: 16.0,
            backgroundColor: Colors.white70,
            child: Icon(Icons.account_circle, size: 30.0),
          ),
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
