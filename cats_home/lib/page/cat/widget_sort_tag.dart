import 'package:flutter/material.dart';

class SortView extends StatefulWidget {
  final SortModel model;
  SortView({Key? key, required this.model}) : super(key: key);

  @override
  _SortViewState createState() => _SortViewState();
}

class _SortViewState extends State<SortView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width - 32,
      height: 66,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Text(
                widget.model.title,
                style: TextStyle(color: Color(0xff1D1E2C), fontSize: 14),
              )),
          Visibility(
              visible: widget.model.isSelected,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  'lib/assets/images/cat/icon_checked.png',
                  height: 20,
                  width: 20,
                ),
              )),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Visibility(
          //       visible: widget.model.isSelected,
          //       child: Image.asset(
          //         'lib/assets/images/cat/icon_checked.png',
          //         height: 20,
          //         width: 20,
          //       )),
          // )
        ],
      ),
    );
  }
}

class SortModel {
  String title;
  bool isSelected;
  SortModel(this.title, this.isSelected);
}
