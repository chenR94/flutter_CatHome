import 'package:cats_home/page/cat/add/variety/index_cat_variety_list_cell.dart';
import 'package:cats_home/page/cat/add/variety/widget_cat_variety_tag.dart';
import 'package:flutter/material.dart';

class CatVarietyListView extends StatefulWidget {
  final List<CatVarietyModel> listDatas;
  final onChange;
  CatVarietyListView({Key? key, this.onChange, required this.listDatas})
      : super(key: key);

  @override
  _CatVarietyListViewState createState() => _CatVarietyListViewState();
}

class _CatVarietyListViewState extends State<CatVarietyListView> {
  var _CatVarietyMap = Map();
  List<dynamic> _IndexKey = [];
  List<CatVarietyModel> cats = [];

  @override
  void initState() {
    super.initState();
    // _ListDatas.sort((CatVarietyModel a, CatVarietyModel b) {
    //   return a.indexLetter.compareTo(b.indexLetter);
    // });

    for (var i = 0; i < widget.listDatas.length; i++) {
      if (i == 0) {
        _CatVarietyMap[widget.listDatas[i].indexLetter] = [widget.listDatas[i]];
      } else {
        if (widget.listDatas[i].indexLetter !=
            widget.listDatas[i - 1].indexLetter) {
          _CatVarietyMap[widget.listDatas[i].indexLetter] = [
            widget.listDatas[i]
          ];
        } else {
          List<CatVarietyModel> temp =
              _CatVarietyMap[widget.listDatas[i].indexLetter];
          print('object: $temp');
          var a = widget.listDatas[i].name;
          print('object1: $a');
          temp.add(widget.listDatas[i]);
          _CatVarietyMap[widget.listDatas[i].indexLetter] = temp;
        }
      }
    }
    _CatVarietyMap =
        new Map<String, List<CatVarietyModel>>.from(_CatVarietyMap);
    _IndexKey = _CatVarietyMap.keys.toList();
    print(_CatVarietyMap);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(_IndexKey.length, (i) {
          return CatVarietyListCell(
            index: _IndexKey[i],
            models: _CatVarietyMap[_IndexKey[i]]!,
            onChange: (CatVarietyModel model, bool isSelected) {
              if (isSelected) {
                cats.insert(0, model);
              } else {
                cats.remove(model);
              }
              widget.onChange(cats);
            },
          );
        }).toList(),
      ),
    );
  }
}
