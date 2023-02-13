import 'package:flutter/material.dart';
import 'package:flutter_catalog/themes/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/themes/app_color.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
    );
  }
}
