import 'package:flutter/material.dart';

class AddCatView extends StatelessWidget {
  const AddCatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          'lib/assets/images/home/addcatbg.png',
          height: 130,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 37,
          left: 2,
          right: 2,
          child: Text(
            '这啥也没有，快去添加猫孕吧~',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(191, 191, 191, 1.0), fontSize: 12),
          ),
        ),
        Positioned(
          bottom: 19,
          left: 125,
          right: 125,
          child: MaterialButton(
            color: Colors.yellow,
            onPressed: () {
              print('登陆');
            },
            child: Text(
              '去添加',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),

            ///圆角
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
      ],
    );
  }
}
