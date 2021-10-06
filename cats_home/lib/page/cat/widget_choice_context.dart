import 'package:cats_home/page/cat/widget_tab.dart';
import 'package:cats_home/page/cat/widget_tag.dart';
import 'package:flutter/material.dart';

class CatSelectedContent extends StatefulWidget {
  final Map<String, List<CatTabModel>> modelMap;
  final onSelected;
  CatSelectedContent({Key? key, this.onSelected, required this.modelMap})
      : super(key: key);

  @override
  _CatSelectedContentState createState() => _CatSelectedContentState();
}

class _CatSelectedContentState extends State<CatSelectedContent> {
  var selectedMap = new Map<String, int>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.5,
          ),
          Row(
            children: [
              Expanded(child: SizedBox()),
              Text(
                '筛选',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              GestureDetector(
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
              SizedBox(
                width: 16,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 31, left: 31, bottom: 29),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildChildGroup('是否种猫'),
                SizedBox(
                  height: 24.5,
                ),
                _buildChildGroup('是否绝育'),
                SizedBox(
                  height: 24.5,
                ),
                _buildChildGroup('性别'),
                SizedBox(
                  height: 24.5,
                ),
                _buildChildGroup('状态'),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 26.5, right: 16),
              child: Row(
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.5,
                        ),
                        Image.asset(
                          'lib/assets/images/cat/icon_clear.png',
                          height: 24,
                          width: 24,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '重置',
                          style: TextStyle(fontSize: 9),
                        )
                      ],
                    ),
                    onTap: () {
                      Iterable<String> keys = this.selectedMap.keys;
                      for (var item in keys) {
                        int? index = this.selectedMap[item];

                        if (index == null) {
                          return;
                        }
                        setState(() {
                          widget.modelMap[item]![index].isSelected = false;
                        });
                      }
                      this.selectedMap.clear();
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: MaterialButton(
                      height: 44,
                      color: Color(0xffFFE733),
                      child: Text(
                        '确定',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                      onPressed: () {
                        widget.onSelected(selectedMap);
                        Navigator.pop(context);
                      },
                    ),
                    flex: 2,
                  )
                ],
              ),
            ),
            height: 60,
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

  Widget _buildChildGroup(String title) {
    List<CatTabModel> models = this.widget.modelMap[title]!;
    print(models.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 13,
        ),
        Wrap(
          spacing: 18.5,
          children: List.generate(models.length, (index) {
            return GestureDetector(
              child: CatTypeTab(
                model: models[index],
              ),
              onTap: () {
                setState(() {
                  selectedMap[title] = index;
                  // widget.onSelected(title, index);
                  models.forEach((element) => element.isSelected = false);
                  models[index].isSelected = true;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
