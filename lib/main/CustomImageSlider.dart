import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mtdz_run/inven/DetailScreen.dart';
import 'package:page_transition/page_transition.dart';

class CustomImageSlider extends StatelessWidget {
  List<Map> shoesList;
  Function onChange;

  CustomImageSlider({
    required this.onChange,
    required this.shoesList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 350.0,
        onPageChanged: (index, reason) => {onChange(index, reason)},
      ),
      items: shoesList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: DetailScreen(item: item),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 10,
                    color: (item['selected'] == true
                        ? Colors.blueAccent
                        : Colors.black),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                // decoration: BoxDecoration(color: Colors.amber),
                child: Column(
                  children: [
                    Text(item['name']),
                    Text('type: ${item['type']}'),
                    Image.asset(
                      item['src'],
                      width: 400,
                      height: 250,
                    ),
                    Text('level :${item['level']}'),
                    Text('durability :${item['durability']}'),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}


//  'Lv': 12,
//       'durability': 58,