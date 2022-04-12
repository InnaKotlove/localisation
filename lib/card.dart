import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyCard extends StatelessWidget {
  final Image image;
  final String title;
  final String data;
  final String price;

  const MyCard(
      {Key? key,
        required this.image,
        required this.title,
        required this.data,
        required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: image,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
                Text(data),
                Text(price),
              ],
            ),
          ],
        ),
      ),
    );
  }
}