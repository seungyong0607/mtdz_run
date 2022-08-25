import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtdz_run/controller/UserController.dart';

class GachaPage extends StatefulWidget {
  const GachaPage({
    Key? key,
  }) : super(key: key);

  @override
  State<GachaPage> createState() => _GachaPageState();
}

class _GachaPageState extends State<GachaPage> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      // appBar: CustomAppbar(title: "Gacha"),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          // implement GridView.builder
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'images/ad.png',
                width: MediaQuery.of(context).size.width,
                height: 450,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 316.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _showdialog(context);
                      },
                      child: const Text("1일 무료 뽑기"),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 140.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _showdialog(context);
                      },
                      child: const Text("1회 뽑기"),
                    ),
                  ),
                  SizedBox(
                    width: 140.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _showdialog2(context);
                      },
                      child: const Text("10회 뽑기"),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  Future<dynamic> _showdialog2(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('결제 확인'),
        content: const Text('10회 뽑으시겠습니까?'),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('10회 뽑기')),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('취소')),
        ],
      ),
    );
  }

  Future<dynamic> _showdialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('1회 뽑기'),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('확인')),
        ],
      ),
    );
  }
}

class _customFlexView extends StatelessWidget {
  final List list;
  const _customFlexView({
    Key? key,
    required this.list,
  }) : super(key: key);

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
        itemCount: list.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(
                  //   // ['${list['$index']["icon"]}']
                  //   ${list['$index']["icon"] == 'd' ? Icons.abc_outlined : Icons.abc_outlined } ,
                  //   color: Colors.blue,
                  //   size: 20.0,
                  // ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${list[index]["type"]}'),
                ],
              ),
              Expanded(
                flex: 2,
                child: Image.asset('${list[index]["src"]}'),
              ),
              Text("${list[index]["name"]}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 20,
                    child: Icon(
                      Icons.currency_bitcoin,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                  Text("1"),
                  SizedBox(
                    width: 20,
                    child: Icon(
                      Icons.currency_franc,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                  Text("12"),
                  SizedBox(
                    width: 20,
                    child: Icon(
                      Icons.currency_pound,
                      color: Colors.black,
                      size: 14,
                    ),
                  ),
                  Text("6"),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}
