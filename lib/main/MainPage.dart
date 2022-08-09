import 'package:flutter/material.dart';
import 'package:mtdz_run/gacha/GachaPage.dart';
import 'package:mtdz_run/inven/InvenPage.dart';
import 'package:mtdz_run/main/CustomImageSlider.dart';
import 'package:mtdz_run/main/MainGaugePart.dart';
import 'package:mtdz_run/main/MainPageFooterPart.dart';
import 'package:mtdz_run/common/TopPart.dart';
import 'package:mtdz_run/shop/ShopPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<MainPage> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  void _onShowNotchChanged(bool value) {
    setState(() {
      _showNotch = value;
    });
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  void _onFabLocationChanged(FloatingActionButtonLocation? value) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
    });
  }

  final List<String> imgList = [
    'images/0.jpg',
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
  ];

  final List<String> nameList = [
    '신발1',
    '신발2',
    '신발3',
    '신발4',
  ];

  final List<Map> shoesList = [
    {
      'name': 'shoes #1',
      'src': 'images/0.png',
      'type': 'Walker',
      'Lv': 24,
      'durability': 100,
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
      'durability': 100,
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
      'durability': 100,
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
      'durability': 100,
      'Efficiency': 1.0,
      'Luck': 1.0,
      'Comfort': 1.0,
      'Resilience': 1.0,
      'selected': false,
    },
  ];

  void onChange() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // automaticallyImplyLeading: false,
          title: const Text('Main Page'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              const TopPart(),
              const SizedBox(height: 30),
              CustomImageSlider(
                shoesList: shoesList,
                imgList: imgList,
                nameList: nameList,
              ),
              const SizedBox(
                height: 20,
              ),
              MainGaugePart(
                shoesList: shoesList,
              ),
              const SizedBox(
                height: 20,
              ),
              const MainPageFooterPart(),
            ],
          ),
        ),
        floatingActionButton: _showFab
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ShopPage(),
                    ),
                  );
                },
                tooltip: 'Create',
                child: const Icon(Icons.add_business),
              )
            : null,
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar: _DemoBottomAppBar(
          fabLocation: _fabLocation,
          shape: _showNotch ? const CircularNotchedRectangle() : null,
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.settings_suggest),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => InvenPage(),
                  ),
                );
              },
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.change_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const GachaPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ListView(
//   padding: const EdgeInsets.only(bottom: 88),
//   children: <Widget>[
//     SwitchListTile(
//       title: const Text(
//         'Floating Action Button',
//       ),
//       value: _showFab,
//       onChanged: _onShowFabChanged,
//     ),
//     SwitchListTile(
//       title: const Text('Notch'),
//       value: _showNotch,
//       onChanged: _onShowNotchChanged,
//     ),
//     const Padding(
//       padding: EdgeInsets.all(16),
//       child: Text('Floating action button position'),
//     ),
//     RadioListTile<FloatingActionButtonLocation>(
//       title: const Text('Docked - End'),
//       value: FloatingActionButtonLocation.endDocked,
//       groupValue: _fabLocation,
//       onChanged: _onFabLocationChanged,
//     ),
//     RadioListTile<FloatingActionButtonLocation>(
//       title: const Text('Docked - Center'),
//       value: FloatingActionButtonLocation.centerDocked,
//       groupValue: _fabLocation,
//       onChanged: _onFabLocationChanged,
//     ),
//     RadioListTile<FloatingActionButtonLocation>(
//       title: const Text('Floating - End'),
//       value: FloatingActionButtonLocation.endFloat,
//       groupValue: _fabLocation,
//       onChanged: _onFabLocationChanged,
//     ),
//     RadioListTile<FloatingActionButtonLocation>(
//       title: const Text('Floating - Center'),
//       value: FloatingActionButtonLocation.centerFloat,
//       groupValue: _fabLocation,
//       onChanged: _onFabLocationChanged,
//     ),
//   ],
// ),
