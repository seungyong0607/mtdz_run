// import 'package:flutter/material.dart';
// import 'package:mtdz_run/gacha/GachaPage.dart';
// import 'package:mtdz_run/inven/InvenPage.dart';

// class MainPage extends StatefulWidget {
//   MainPage({Key? key}) : super(key: key);

//   @override
//   State createState() => _BottomAppBarDemoState();
// }

// class _BottomAppBarDemoState extends State<MainPage> {
//   bool _showFab = true;
//   bool _showNotch = true;
//   FloatingActionButtonLocation _fabLocation =
//       FloatingActionButtonLocation.endDocked;

//   // void _onShowNotchChanged(bool value) {
//   //   setState(() {
//   //     _showNotch = value;
//   //   });
//   // }

//   // void _onShowFabChanged(bool value) {
//   //   setState(() {
//   //     _showFab = value;
//   //   });
//   // }

//   // void _onFabLocationChanged(FloatingActionButtonLocation? value) {
//   //   setState(() {
//   //     _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           // automaticallyImplyLeading: false,
//           title: const Text('Main Page'),
//         ),
//         body: Row(),
//         // floatingActionButton: _showFab
//         //     ? FloatingActionButton(
//         //         onPressed: () {
//         //           Navigator.push(
//         //             context,
//         //             MaterialPageRoute(
//         //               builder: (BuildContext context) => ShopPage(),
//         //             ),
//         //           );
//         //         },
//         //         tooltip: 'Create',
//         //         child: const Icon(Icons.add_business),
//         //       )
//         //     : null,
//         // floatingActionButtonLocation: _fabLocation,
//         // bottomNavigationBar: _DemoBottomAppBar(
//         //   fabLocation: _fabLocation,
//         //   shape: _showNotch ? const CircularNotchedRectangle() : null,
//         // ),
//       ),
//     );
//   }
// }

// class _DemoBottomAppBar extends StatelessWidget {
//   _DemoBottomAppBar({
//     this.fabLocation = FloatingActionButtonLocation.endDocked,
//     this.shape = const CircularNotchedRectangle(),
//   });

//   final FloatingActionButtonLocation fabLocation;
//   final NotchedShape? shape;

//   static final List<FloatingActionButtonLocation> centerLocations =
//       <FloatingActionButtonLocation>[
//     FloatingActionButtonLocation.centerDocked,
//     FloatingActionButtonLocation.centerFloat,
//   ];

//   final Map<String, dynamic> userInfo = {
//     "coin": 33.33,
//     "box": 0,
//     "key": 0,
//   };

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       shape: shape,
//       color: Colors.blue,
//       child: IconTheme(
//         data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
//         child: Row(
//           children: <Widget>[
//             IconButton(
//               tooltip: 'Open navigation menu',
//               icon: const Icon(Icons.home),
//               onPressed: () {},
//             ),
//             if (centerLocations.contains(fabLocation)) const Spacer(),
//             IconButton(
//               tooltip: 'Search',
//               icon: const Icon(Icons.settings_suggest),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (BuildContext context) => InvenPage(
//                       userInfo: userInfo,
//                     ),
//                   ),
//                 );
//               },
//             ),
//             IconButton(
//               tooltip: 'Favorite',
//               icon: const Icon(Icons.change_circle),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (BuildContext context) => const GachaPage(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
