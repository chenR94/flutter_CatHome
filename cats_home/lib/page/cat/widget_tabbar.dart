import 'package:cats_home/page/cat/widget_tab.dart';
import 'package:flutter/material.dart';

class CatTabBar extends StatefulWidget {
  final List<CatTabModel> models;
  final onChange;
  CatTabBar({Key? key, required this.models, this.onChange}) : super(key: key);

  @override
  _CatTabBarState createState() => _CatTabBarState();
}

class _CatTabBarState extends State<CatTabBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List<Widget>.generate(widget.models.length, (index) {
      return InkWell(
          child: CatTab(
            model: CatTabModel(
              widget.models[index].title,
              widget.models[index].isSelected,
            ),
          ),
          onTap: () {
            setState(() {
              widget.onChange(index);
              widget.models.forEach((element) => element.isSelected = false);
              widget.models[index].isSelected = true;
            });
          });
    }));
  }
}
