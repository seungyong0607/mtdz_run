import 'package:flutter/material.dart';
import 'package:mtdz_run/common/CustomCircleAvatar.dart';

class TopPart extends StatefulWidget {
  Map<dynamic, dynamic> userInfo;
  TopPart({
    required this.userInfo,
    Key? key,
  }) : super(key: key);

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
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
          child: Container(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.currency_bitcoin,
                    color: Colors.black,
                  ),
                ),
                Text(widget.userInfo['coin'].toString()),
                SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.home_repair_service,
                    color: Colors.black,
                  ),
                ),
                Text(widget.userInfo['box'].toString()),
                SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.key_outlined,
                    color: Colors.black,
                  ),
                ),
                Text(widget.userInfo['key'].toString()),
              ],
            ),
          ),
        )
      ],
    );
  }
}
