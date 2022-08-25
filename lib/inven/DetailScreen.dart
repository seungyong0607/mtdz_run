import 'package:flutter/material.dart';
import 'package:mtdz_run/main/MainGaugePart.dart';

class DetailScreen extends StatelessWidget {
  final Map<dynamic, dynamic> item;
  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item['name'])),
      body: Container(
        child: Column(children: [
          if (item.containsKey('src')) ...[
            Image.asset(
              item['src'].toString(),
              width: 100,
              height: 200,
            ),
          ] else if (item.containsKey('icon')) ...[
            Icon(
              item['icon'],
              color: item['color'],
              size: 100.0,
            ),
          ],
          const SizedBox(
            height: 20,
          ),
          MainGaugePart(
            shoes: item,
          ),
        ]),
      ),
    );
  }
}
