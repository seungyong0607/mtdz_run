import 'package:flutter/material.dart';
import 'package:mtdz_run/common/CustomCircleAvatar.dart';

class TopPart extends StatefulWidget {
  Map<dynamic, dynamic>? userInfo;
  TopPart({
    this.userInfo,
    Key? key,
  }) : super(key: key);

  @override
  State<TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  final Map<dynamic, dynamic> userInfo = {
    "mater": 0.0,
    "coin": 103,
    "box": 0,
    "key": 0,
  };

  void changeUserInfo(nextInfo) async {
    setState(() {
      userInfo['mater'] += nextInfo['mater'];
      userInfo['box'] += nextInfo['box'];
      userInfo['key'] += nextInfo['key'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomCircleAvatar(),
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
                const SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.currency_bitcoin,
                    color: Colors.black,
                  ),
                ),
                _CustorText(
                  text: userInfo['coin'].toString(),
                ),
                const SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.home_repair_service,
                    color: Colors.black,
                  ),
                ),
                _CustorText(
                  text: userInfo['box'].toString(),
                ),
                const SizedBox(
                  width: 20,
                  child: Icon(
                    Icons.key_outlined,
                    color: Colors.black,
                  ),
                ),
                _CustorText(
                  text: userInfo['key'].toString(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _CustorText extends StatelessWidget {
  final String text;
  const _CustorText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
