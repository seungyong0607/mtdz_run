import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtdz_run/controller/UserController.dart';

class BoxList extends StatefulWidget {
  final List list;
  const BoxList({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  State<BoxList> createState() => _BoxListState();
}

class _BoxListState extends State<BoxList> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 8,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 180,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 40,
        ),
        itemCount: widget.list.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () async {
                print(widget.list[index]['needKey']);
                if (widget.list[index]['needKey'] > controller.user().key) {
                  // return Navigator.of(context).pop(false);
                  _errorMessage(context);
                  return;
                }

                if (widget.list[index]['count'] <= 1) {
                  final callbackValue = await _keyOpenDialog(
                    context,
                    item: widget.list[index],
                    userInfo: controller.user(),
                  );

                  // widget.changeUserInfo(coin: callbackValue.toInt());

                  if (callbackValue != null) {
                    controller.updateInfo(
                      coin: callbackValue['point'].toInt(),
                      subtractKey: callbackValue['keyCount'].toInt(),
                      subtractBox: callbackValue['boxCount'],
                    );

                    await _showBox(context, coinCount: callbackValue);
                  }
                } else {
                  final callbackValue = await _multikeysOpenDialog(
                    context,
                    needKey: widget.list[index]['needKey'],
                    grade: widget.list[index]['grade'],
                    key: controller.user().key,
                    boxCount: widget.list[index]['count'],
                  );

                  if (callbackValue != null) {
                    controller.updateInfo(
                      coin: callbackValue['point'].toInt(),
                      subtractKey: callbackValue['keyCount'].toInt(),
                      subtractBox: callbackValue['boxCount'],
                    );

                    await _showBox(context, coinCount: callbackValue);
                  }
                }
              },
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 4,
                    ),
                    Text('${widget.list[index]["grade"]}'),
                  ],
                ),
                Expanded(
                  child: Icon(
                    widget.list[index]['icon'],
                    size: 100.0,
                    color: widget.list[index]['color'],
                  ),
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${widget.list[index]["name"]}"),
                    Text(" x ${widget.list[index]['count'].toString()}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("??????"),
                    const SizedBox(
                      width: 24,
                      child: Icon(
                        Icons.key_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Text(widget.list[index]['needKey'].toString()),
                  ],
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> _keyOpenDialog(
    BuildContext context, {
    required item,
    required userInfo,
  }) {
    //['needKey']
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          height: 70,
          child: Column(
            children: [
              Text('????????? ????????? ???????????????????'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.key),
                  Text("${item['needKey']} ??????"),
                ],
              ),
              Text('(?????? ?????? ??????: ${userInfo.key})'),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('??????')),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop({
                    "point": getRandomValue(grade: item['grade']),
                    "keyCount": item['needKey'],
                    "boxCount": 1,
                  }),
              child: const Text('??????')),
        ],
      ),
    );
  }

  int getRandomValue({
    required grade,
  }) {
    int value = 0;

    if (grade == 'L') {
      value = Random().nextInt(1000) + 500;
    }

    if (grade == 'UR') {
      value = Random().nextInt(500) + 300;
    }

    if (grade == 'SR') {
      value = Random().nextInt(400) + 200;
    }

    if (grade == 'R') {
      value = Random().nextInt(50) + 150;
    }

    if (grade == 'N') {
      value = Random().nextInt(50) + 50;
    }

    return value;
  }

  Future<dynamic> _multikeysOpenDialog(
    BuildContext context, {
    required needKey,
    required grade,
    required boxCount,
    required key,
  }) {
    late double _currentSliderValue = 1;

    int keyValue = (key / needKey).toInt();
    int tempInt = boxCount - keyValue;

    final maxValue = tempInt > 0 ? keyValue : boxCount;
    // final maxValue = 1;

    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          height: 140,
          child: Column(
            children: [
              const Text('????????? ????????? ?????? ??????'),
              Text('????????? ?????? $needKey??? ??????'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("$_currentSliderValue ???"),
                  // StatefulBuilder(builder: (context, state) {
                  // }),
                  StatefulBuilder(builder: (context, state) {
                    return Column(
                      children: [
                        Text("${_currentSliderValue.toInt()} ???"),
                        Slider(
                          min: 0.0,
                          max: maxValue.toDouble(),
                          value: _currentSliderValue,
                          divisions: maxValue,
                          label: '${_currentSliderValue.round()}',
                          onChanged: (value) {
                            state(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                      ],
                    );
                  })
                ],
              ),
              Text('(?????? ?????? ??????: ${controller.user().key})'),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('??????')),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop({
                    "point": getRandomValue(grade: grade) *
                        _currentSliderValue.toInt(),
                    "keyCount": _currentSliderValue.toInt() * needKey,
                    "boxCount": _currentSliderValue.toInt(),
                  }),
              child: const Text('??????')),
        ],
      ),
    );
  }

  Future<dynamic> _showBox(BuildContext context, {required coinCount}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('????????? ?????????????????????.'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.currency_bitcoin),
                  Text("${coinCount['point']} point"),
                ],
              ),
              Text("${coinCount['keyCount']} key ??????"),
              Text("${coinCount['boxCount']} box ?????? "),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('??????'),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _errorMessage(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('????????? ???????????????.'),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('??????'),
          ),
        ],
      ),
    );
  }
}
