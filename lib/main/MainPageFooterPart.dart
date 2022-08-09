import 'package:flutter/material.dart';
import 'package:mtdz_run/detail/RunDetailPage.dart';

class MainPageFooterPart extends StatelessWidget {
  const MainPageFooterPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            child: const Text("Start"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const RunDetail(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(),
          ),
        )
      ],
    );
  }
}
