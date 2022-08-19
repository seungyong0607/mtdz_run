import 'package:flutter/material.dart';
import 'package:mtdz_run/common/CustomAppbar.dart';
import 'package:mtdz_run/common/TopPart.dart';

class InvenPage extends StatefulWidget {
  InvenPage({
    // required this.userInfo,
    Key? key,
  }) : super(key: key);

  @override
  State<InvenPage> createState() => _InvenPageState();
}

class _InvenPageState extends State<InvenPage> {
  late List<bool> _isSelected = List.generate(3, (_) => false);
  late List<bool> _isSelected2 = List.generate(2, (_) => false);

  final List<Map> myProducts =
      List.generate(4, (index) => {"id": index, "name": "shoes #$index"})
          .toList();

  // final Map<String, dynamic> userInfo = {
  //   "coin": 33.33,
  //   "box": 0,
  //   "key": 0,
  // };

  final Map<String, dynamic> userInfo = {
    "coin": 33.33,
    "box": 0,
    "key": 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppbar(title: "Inventory"),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 14,
            ),
            ToggleButtons(
              children: const <Widget>[
                Text("Sneakers"),
                Text("Game"),
                Text("Badges"),
              ],
              constraints: BoxConstraints(
                  minWidth: (MediaQuery.of(context).size.width - 36) / 3),
              onPressed: (int index) {
                setState(() {
                  _isSelected[index] = !_isSelected[index];
                });
              },
              isSelected: _isSelected,
            ),
            ToggleButtons(
              children: const <Widget>[
                Text("Sneakers"),
                Text("Shoeboxes"),
              ],
              constraints: BoxConstraints(
                  minWidth: (MediaQuery.of(context).size.width - 36) / 2),
              onPressed: (int index) {
                setState(() {
                  _isSelected2[index] = !_isSelected2[index];
                });
              },
              isSelected: _isSelected2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.roller_skating,
                          color: Colors.blue,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("Jogger"),
                      ],
                    ),
                    Expanded(
                      child: Image.asset('images/${myProducts[0]["id"]}.png'),
                      flex: 2,
                    ),
                    Text("${myProducts[0]["name"]}"),
                    Row(
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
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.roller_skating,
                          color: Colors.blue,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("Jogger"),
                      ],
                    ),
                    Expanded(
                      child: Image.asset('images/${myProducts[1]["id"]}.png'),
                      flex: 2,
                    ),
                    Text("${myProducts[1]["name"]}"),
                    Row(
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
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
