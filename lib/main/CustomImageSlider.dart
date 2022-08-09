import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        height: 200.0,
        onPageChanged: (index, reason) => {onChange(index, reason)},
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
                    width: 10,
                    color: (item['selected'] == true
                        ? Colors.blueAccent
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
