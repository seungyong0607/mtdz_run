import 'package:flutter/material.dart';
import 'package:mtdz_run/common/TopPart.dart';

class InvenPage extends StatefulWidget {
  InvenPage({Key? key}) : super(key: key);

  @override
  State<InvenPage> createState() => _InvenPageState();
}

class _InvenPageState extends State<InvenPage> {
  late List<bool> _isSelected = List.generate(3, (_) => false);
  late List<bool> _isSelected2 = List.generate(2, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 14,
            ),
            TopPart(),
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
                Card(
                  shape: RoundedRectangleBorder(
                    //모서리를 둥글게 하기 위해 사용
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0, //그림자 깊이
                  child: Image.asset('images/0.jpg', width: 180),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    //모서리를 둥글게 하기 위해 사용
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0, //그림자 깊이
                  child: Image.asset('images/1.jpg', width: 180),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    //모서리를 둥글게 하기 위해 사용
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0, //그림자 깊이
                  child: Image.asset('images/2.jpg', width: 180),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    //모서리를 둥글게 하기 위해 사용
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 4.0, //그림자 깊이
                  child: Image.asset('images/3.jpg', width: 180),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
