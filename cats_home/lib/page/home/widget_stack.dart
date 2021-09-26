import 'package:flutter/material.dart';

class CatInfoView extends StatelessWidget {
  final String title;
  final String sum;
  final String imgUrl;

  CatInfoView(this.imgUrl, this.title, this.sum);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          imgUrl,
          height: 103,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 45,
          left: 2,
          right: 2,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 2,
          right: 2,
          child: Text(
            sum,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
