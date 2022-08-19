import 'package:flutter/material.dart';
import 'package:mtdz_run/common/CustomAppbar.dart';

import 'package:group_button/group_button.dart';

class GachaPage extends StatefulWidget {
  const GachaPage({Key? key}) : super(key: key);

  @override
  State<GachaPage> createState() => _GachaPageState();
}

class _GachaPageState extends State<GachaPage> {
  final List<Map> myProducts =
      List.generate(4, (index) => {"id": index, "name": "shoes #$index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      // appBar: CustomAppbar(title: "Gacha"),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          // implement GridView.builder
          child: Column(
            children: [
              Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      GroupButton(
                        buttons: ["Sneakers", "Gems", "Badges"],
                        onSelected: ((value, index, isSelected) {
                          print(
                            value,
                          );
                        }),
                      ),
                      GroupButton(
                        isRadio: true,
                        buttons: ["12:00", "13:00", "21:40"],
                      ),
                      GroupButton(
                        buttons: ["Sneakers", "Enhance", "Shoeboxes"],
                        onSelected: ((value, index, isSelected) {
                          print(
                            value,
                          );
                        }),
                      ),
                    ],
                  )),
              Flexible(
                flex: 8,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 40,
                  ),
                  itemCount: myProducts.length,
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
                          children: const [
                            Icon(
                              Icons.roller_skating,
                              color: Colors.blue,
                              size: 20.0,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text("Jogger"),
                          ],
                        ),
                        Expanded(
                          child: Image.asset(
                              'images/${myProducts[index]["id"]}.png'),
                          flex: 2,
                        ),
                        Text("${myProducts[index]["name"]}"),
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
                      // mage.asset(item, fit: BoxFit.cover),
                      // child: Text(
                      //   myProducts[index]["id"].toString(),
                      //   style: TextStyle(color: Colors.white, fontSize: 20),
                      // ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
