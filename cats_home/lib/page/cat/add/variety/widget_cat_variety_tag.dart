import 'package:flutter/material.dart';

class CatVarietyTag extends StatefulWidget {
  final CatVarietyModel model;
  final onChange;
  CatVarietyTag({Key? key, required this.model, this.onChange})
      : super(key: key);

  @override
  _CatVarietyTagState createState() => _CatVarietyTagState();
}

class _CatVarietyTagState extends State<CatVarietyTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      child: Stack(
        children: [
          Container(
            height: 33,
            padding: EdgeInsets.only(top: 5, right: 5),
            child: FilterChip(
              backgroundColor: Color(0xffFFFFFF),
              label: Text(
                widget.model.name,
              ),
              padding: EdgeInsets.only(top: -5),
              labelPadding: EdgeInsets.only(
                left: 12.5,
                right: 12.5,
              ),
              labelStyle: TextStyle(
                color: widget.model.isSelected
                    ? Color(0xff1D1E2C)
                    : Color(0xff999999),
                fontSize: 12,
              ),
              selected: widget.model.isSelected,
              selectedColor: Color(0xffFFFEF2),
              showCheckmark: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: BorderSide(
                  width: 0.5,
                  color: widget.model.isSelected
                      ? Color(0xffFFE733)
                      : Color(0xffEEEEEE),
                ),
              ),
              onSelected: (value) {
                print('CatVarietyTag: $value');
                setState(() {
                  widget.model.isSelected = !widget.model.isSelected;
                });
                widget.onChange(widget.model, widget.model.isSelected);
              },
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Visibility(
              visible: widget.model.isSelected,
              child: Image.asset(
                'lib/assets/images/cat/icon_checked.png',
                height: 16,
                width: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatVarietyModel {
  String name;
  String indexLetter;
  String value;
  bool isSelected;

  CatVarietyModel(this.name, this.indexLetter, this.value, this.isSelected);
}
