import 'package:flutter/material.dart';
import 'package:mtdz_run/map/MapScreen.dart';

class Footer extends StatelessWidget {
  final VoidCallback play;
  final bool flag;

  const Footer({
    Key? key,
    required this.play,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const MapScreen(),
                ),
              );
            },
            iconSize: 40,
            icon: const Icon(Icons.map_outlined),
          ),
          IconButton(
            onPressed: play,
            iconSize: 70,
            icon: (flag
                ? const Icon(Icons.pause_circle_outline)
                : const Icon(Icons.play_circle_outline)),
          ),
          // Container(
          //   width: 50,
          //   height: 50,
          //   child: Center(
          //     child: IconButton(
          //       iconSize: 40,
          //       icon: const Icon(Icons.run_circle_outlined),
          //       onPressed: () {},
          //       // style: TextStyle(fontSize: 25),
          //     ),
          //   ),
          //   decoration: ShapeDecoration(
          //     color: Colors.white,
          //     shape:
          //         CircleBorder(side: BorderSide(width: 3, color: Colors.blue)),
          //   ),
          // ),

          IconButton(
            onPressed: () {
              debugPrint("d");
            },
            iconSize: 40,
            icon: const Icon(Icons.run_circle_outlined),
          ),
        ],
      ),
    );
  }
}
