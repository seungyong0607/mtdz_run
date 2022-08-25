import 'package:flutter/material.dart';
import 'package:mtdz_run/common/CustomAppbar.dart';

import 'package:group_button/group_button.dart';
import 'package:mtdz_run/inven/BoxList.dart';
import 'package:mtdz_run/inven/DetailScreen.dart';
import 'package:page_transition/page_transition.dart';

class InvenPage extends StatefulWidget {
  const InvenPage({
    Key? key,
    required this.shoesList,
    required this.boxList,
  }) : super(key: key);

  final List<Map<dynamic, dynamic>> shoesList;
  final List<Map<dynamic, dynamic>> boxList;

  @override
  State<InvenPage> createState() => _InvenPageState();
}

class _InvenPageState extends State<InvenPage> {
  late List<Map<dynamic, dynamic>> filterShoesList = widget.shoesList;
  late List<Map<dynamic, dynamic>> filterBoxList = widget.boxList;

  List<String> tabs = ["Sneakers", "Box"];
  List<String> shoesTypeTabs = ["Jogger", "Walker"];

  String selectedTab = 'Sneakers';
  String shoesType = '';
  String boxType = '';

  final controller = GroupButtonController(selectedIndex: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(filterShoesList);
  }

  @override
  Widget build(BuildContext context) {
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
                      buttons: tabs,
                      controller: controller,
                      onSelected: ((value, index, isSelected) {
                        setState(() {
                          selectedTab = value.toString();
                        });
                      }),
                    ),
                    if (selectedTab == 'Sneakers' || selectedTab == '')
                      GroupButton(
                        buttons: shoesTypeTabs,
                        onSelected: ((value, index, isSelected) {
                          setState(() {
                            shoesType = value.toString();
                            filterShoesList = widget.shoesList.where((element) {
                              return element['type'] == shoesType;
                            }).toList();
                          });
                        }),
                      ),
                  ],
                ),
              ),
              if (selectedTab == 'Sneakers' && shoesType != '')
                _customFlexView(list: filterShoesList),
              if (selectedTab == 'Box')
                BoxList(
                  list: filterBoxList,
                ),
              if (selectedTab == 'Sneakers' && shoesType == '')
                _customFlexView(list: widget.shoesList),
            ],
          )),
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
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: DetailScreen(item: list[index]),
                  ),
                );
              },
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
                  child: Image.asset('${list[index]["src"]}'),
                  flex: 2,
                ),
                Text("${list[index]["name"]}"),
              ]),
            ),
          );
        },
      ),
    );
  }
}
