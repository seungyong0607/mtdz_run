import 'package:flutter/material.dart';
import 'package:mtdz_run/detail/RunDetailPage.dart';

class MainPageFooterPart extends StatefulWidget {
  Map selectedItem;
  final VoidCallback changeUserInfo;

  MainPageFooterPart({
    Key? key,
    required this.changeUserInfo,
    required this.selectedItem,
  }) : super(key: key);

  @override
  State<MainPageFooterPart> createState() => _MainPageFooterPartState();
}

class _MainPageFooterPartState extends State<MainPageFooterPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => RunDetail(
                    selectedItem: widget.selectedItem,
                    // changeUserInfo: widget.changeUserInfo,
                  ),
                ),
              ).then((value) => {widget.changeUserInfo()});
            },
            style: ElevatedButton.styleFrom(),
            child: const Text("Start"),
          ),
        )
      ],
    );
  }
}
