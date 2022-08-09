import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomImageSlider extends StatelessWidget {
  List<String> imgList;
  List<String> nameList;
  List<Map> shoesList;

  CustomImageSlider({
    required this.shoesList,
    required this.imgList,
    required this.nameList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        onPageChanged: (index, reason) {
          print("$index");
        },
      ),
      items: shoesList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return new GestureDetector(
              onTap: () {
                print("d");
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: (item['selected'] == true
                        ? Colors.orange
                        : Colors.black),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                // decoration: BoxDecoration(color: Colors.amber),
                child: Image.asset(item['src'], fit: BoxFit.cover),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
