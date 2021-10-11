import 'package:cats_home/page/cat/add/variety/widget_cat_variety_tag.dart';
import 'package:flutter/material.dart';

class CatVarietyListCell extends StatefulWidget {
  final String index;
  final List<CatVarietyModel> models;
  final onChange;
  CatVarietyListCell(
      {Key? key, required this.index, required this.models, this.onChange})
      : super(key: key);

  @override
  _CatVarietyListCellState createState() => _CatVarietyListCellState();
}

class _CatVarietyListCellState extends State<CatVarietyListCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            widget.index,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Wrap(
            spacing: 16,
            runSpacing: 12.5,
            children: List.generate(widget.models.length, (index) {
              return CatVarietyTag(
                model: widget.models[index],
                onChange: (CatVarietyModel model, bool isSelected) {
                  widget.onChange(model, isSelected);
                },
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
