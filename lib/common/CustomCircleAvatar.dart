import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double mater;
  const CustomCircleAvatar({
    Key? key,
    required this.mater,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/myPage');
        // Navigator.push(context, MyPage());
      },
      child: Container(
        width: 30,
        // decoration:
        //     BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 16.0,
                backgroundColor: Colors.white70,
                child: Icon(Icons.account_circle, size: 40.0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, top: 2),
                child: Text(
                  "${mater}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
