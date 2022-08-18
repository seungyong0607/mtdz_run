import 'package:flutter/material.dart';
import 'package:mtdz_run/common/CustomAppbar.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: CustomAppbar(title: "Shop Page"),
    );
  }
}
