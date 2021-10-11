import 'package:cats_home/page/cat/widget_tab.dart';
import 'package:flutter/material.dart';

class CatTypeTab<T> extends StatefulWidget {
  final T model;
  CatTypeTab({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _CatTypeTabState createState() => _CatTypeTabState();
}

class _CatTypeTabState extends State<CatTypeTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 66,
        height: 28, //child居中
        child: Center(
          child: Text(
            widget.model.title,
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 12,
                color: (widget.model.isSelected)
                    ? Colors.black
                    : Color(0xff999999)),
          ),
        ),
        decoration: BoxDecoration(
          color: (widget.model.isSelected) ? Colors.yellow : Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(14),
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
