import 'package:flutter/material.dart';
import 'package:mtdz_run/common/CustomAppbar.dart';
import 'package:mtdz_run/common/TopPart.dart';
import 'package:mtdz_run/main/CustomImageSlider.dart';
import 'package:mtdz_run/main/MainGaugePart.dart';
import 'package:mtdz_run/main/MainPageFooterPart.dart';

class SliderPage extends StatefulWidget {
  SliderPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  List<Map> shoesList = [
    {
      'name': 'shoes #1',
      'src': 'images/0.png',
      'type': 'Walker',
      'level': '24',
      'durability': 12,
      'Efficiency': 17.0,
      'Luck': 8.6,
      'Comfort': 14.6,
      'Resilience': 17.9,
      'selected': true,
      "minStart": 0.0,
      "minEnd": 0.5,
      "rangeIn": 0.5,
      "rangeOut": 3.5,
      "maxStart": 3.5,
      "maxEnd": 4.0,
    },
    {
      'name': 'shoes #2',
      'src': 'images/1.png',
      'type': 'Walker',
      'level': '2',
      'durability': 41,
      'Efficiency': 12.0,
      'Luck': 4.3,
      'Comfort': 11.1,
      'Resilience': 1.0,
      'selected': false,
      "minStart": 0.0,
      "minEnd": 0.5,
      "rangeIn": 0.5,
      "rangeOut": 3.5,
      "maxStart": 3.5,
      "maxEnd": 4.0,
    },
    {
      'name': 'shoes #3',
      'src': 'images/2.png',
      'type': 'Jogger',
      'level': 12,
      'durability': 58,
      'Efficiency': 25.0,
      'Luck': 29.0,
      'Comfort': 7.3,
      'Resilience': 12.2,
      'selected': false,
      "minStart": 0.0,
      "minEnd": 1.5,
      "rangeIn": 1.5,
      "rangeOut": 8.5,
      "maxStart": 8.5,
      "maxEnd": 10.0,
    },
    {
      'name': 'shoes #4',
      'src': 'images/3.png',
      'type': 'Jogger',
      'level': 18,
      'durability': 99,
      'Efficiency': 1.0,
      'Luck': 1.0,
      'Comfort': 1.0,
      'Resilience': 1.0,
      'selected': false,
      "minStart": 0.0,
      "minEnd": 1.5,
      "rangeIn": 1.5,
      "rangeOut": 8.5,
      "maxStart": 8.5,
      "maxEnd": 10.0,
    },
  ];

  late Map<dynamic, dynamic> selectedItem = shoesList[0];
  int selectedIndex = 0;

  void onChange(index, reason) {
    setState(() {
      shoesList.forEach((element) {
        element['selected'] = false;
      });
      selectedIndex = index;
      shoesList[index]['selected'] = true;
      selectedItem = shoesList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppbar(title: "Main"),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10),
          const SizedBox(height: 30),
          CustomImageSlider(
            onChange: onChange,
            shoesList: shoesList,
          ),
          const SizedBox(
            height: 20,
          ),
          MainGaugePart(
            shoes: shoesList[selectedIndex],
          ),
          const SizedBox(
            height: 20,
          ),
          MainPageFooterPart(
            selectedItem: selectedItem,
          ),
        ],
      ),
    );
  }
}
