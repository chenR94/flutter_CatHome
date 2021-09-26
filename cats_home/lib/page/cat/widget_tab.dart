import 'package:flutter/material.dart';

class CatTab extends StatefulWidget {
  final CatTabModel model;
  CatTab({Key? key, required this.model}) : super(key: key);

  @override
  _CatTabState createState() => _CatTabState();
}

class _CatTabState extends State<CatTab> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: InkWell(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(11),
              child: Text(widget.model.title,
                  style: widget.model.isSelected
                      ? TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)
                      : TextStyle(
                          color: Color.fromARGB(255, 150, 150, 150),
                          fontSize: 14)),
            ),
            Visibility(
                visible: widget.model.isSelected,
                child: Container(
                  width: 40,
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(
                        //圆角
                        Radius.circular(3.0),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}

class CatTabModel {
  String title;
  bool isSelected;
  CatTabModel(this.title, this.isSelected);
}
