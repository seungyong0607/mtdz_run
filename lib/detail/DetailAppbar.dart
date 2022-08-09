import 'package:flutter/material.dart';

class DetailAppbar extends StatefulWidget {
  const DetailAppbar({Key? key}) : super(key: key);

  @override
  State<DetailAppbar> createState() => _DetailAppbarState();
}

class _DetailAppbarState extends State<DetailAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.blue,
      elevation: 0.0,
      titleSpacing: 10,
      leading: null,
      title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: const <Widget>[
          ClipRect(
            child: Icon(
              Icons.run_circle,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            'Running',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
