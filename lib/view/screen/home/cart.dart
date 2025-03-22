import 'package:flutter/material.dart';
import 'package:store313/view/widiget/cart/appbarcart.dart';
import 'package:store313/view/widiget/cart/appnubberofflist.dart';
import 'package:store313/view/widiget/cart/custombottomnavigationpar.dart';
import 'package:store313/view/widiget/cart/customordercart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Custombottomnavigationpar(
        totalprice: '2100',
        price: '1900',
        shapping: '200',
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: const [
            Appbarcart(),
            SizedBox(
              height: 10,
            ),
            Appnubberofflist(
              title: 'YOu Have 2 items in your list',
            ),
            SizedBox(
              height: 10,
            ),
            Customordercart(
              title: ' macbook m 3',
              price: '1500',
              count: '1',
            )
          ],
        ),
      ),
    );
  }
}
