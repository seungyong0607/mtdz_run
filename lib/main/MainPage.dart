import 'package:flutter/material.dart';
import 'package:mtdz_run/gacha/GachaPage.dart';
import 'package:mtdz_run/inven/InvenPage.dart';
import 'package:mtdz_run/main/SliderPage.dart';
import 'package:mtdz_run/shop/ShopPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  // final Map<String, dynamic> userInfo = {
  //   "coin": 33.33,
  //   "box": 0,
  //   "key": 0,
  // };

  final List<Map> shoesList = [
    {
      'name': 'shoes #1',
      'src': 'images/0.png',
      'type': 'Walker',
      'Lv': 24,
      'durability': 12,
      'Efficiency': 17.0,
      'Luck': 8.6,
      'Comfort': 14.6,
      'Resilience': 17.9,
      'selected': true,
    },
    {
      'name': 'shoes #2',
      'src': 'images/1.png',
      'type': 'Walker',
      'Lv': 2,
      'durability': 41,
      'Efficiency': 12.0,
      'Luck': 4.3,
      'Comfort': 11.1,
      'Resilience': 1.0,
      'selected': false,
    },
    {
      'name': 'shoes #3',
      'src': 'images/2.png',
      'type': 'Jogger',
      'Lv': 12,
      'durability': 58,
      'Efficiency': 25.0,
      'Luck': 29.0,
      'Comfort': 7.3,
      'Resilience': 12.2,
      'selected': false,
    },
    {
      'name': 'shoes #4',
      'src': 'images/3.png',
      'type': 'Jogger',
      'Lv': 18,
      'durability': 99,
      'Efficiency': 1.0,
      'Luck': 1.0,
      'Comfort': 1.0,
      'Resilience': 1.0,
      'selected': false,
    },
  ];

  final pages = [
    SliderPage(),
    InvenPage(),
    GachaPage(),
    ShopPage(),
  ];

  onChangeSelectedItem() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: currentIndex,
        // iconSize: 40,
        // showUnselectedLabels: false,
        // showSelectedLabels: false,
        onTap: (index) => setState(
          () {
            currentIndex = index;
          },
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.precision_manufacturing),
            label: 'Gacha',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business),
            label: 'Shop',
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
