import 'package:flutter/material.dart';
import 'package:mtdz_run/common/CustomCircleAvatar.dart';

class TopPart extends StatelessWidget {
  const TopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomCircleAvatar(),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              width: 1,
              color: Colors.black,
            ),
            boxShadow: const [
              BoxShadow(
                // color: Colors.grey[500],
                offset: Offset(2.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-2.0, -2.0),
                blurRadius: 4.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 20,
                child: Icon(
                  Icons.currency_bitcoin,
                  color: Colors.black,
                ),
              ),
              Text("10"),
              SizedBox(
                width: 20,
                child: Icon(
                  Icons.currency_franc,
                  color: Colors.black,
                ),
              ),
              Text("102,000"),
              SizedBox(
                width: 20,
                child: Icon(
                  Icons.currency_pound,
                  color: Colors.black,
                ),
              ),
              Text("10,000"),
            ],
          ),
        )
      ],
    );
  }
}
