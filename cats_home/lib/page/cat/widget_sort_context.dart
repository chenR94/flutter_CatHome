import 'package:cats_home/page/cat/widget_sort_tag.dart';
import 'package:flutter/material.dart';

class CatSortView extends StatefulWidget {
  CatSortView({Key? key}) : super(key: key);

  @override
  _CatSortViewState createState() => _CatSortViewState();
}

class _CatSortViewState extends State<CatSortView> {
  var models = [SortModel('年龄从小到大', false), SortModel('年龄从大到小', false)];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  '排序',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Image.asset(
                    'lib/assets/images/cat/icon_close.png',
                    height: 20,
                    width: 20,
                  ),
                  onTap: () {
                    print('close');
                    Navigator.pop(context);
                  },
                ),
              )
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            direction: Axis.vertical,
            children: List.generate(this.models.length, (index) {
              return GestureDetector(
                child: SortView(model: this.models[index]),
                onTap: () {
                  setState(() {
                    models.forEach((element) => element.isSelected = false);
                    this.models[index].isSelected = true;
                  });
                },
              );
            }).toList(),
          ),
          Expanded(child: SizedBox()),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            alignment: Alignment.center,
            child: MaterialButton(
              minWidth: double.infinity,
              height: 44,
              color: Color(0xffFFE733),
              child: Text(
                '确定',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            height: 64,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color(0xffE8E8ED),
                blurRadius: 2,
                offset: Offset(0, 0),
              )
            ]),
          )
        ],
      ),
    );
  }
}
