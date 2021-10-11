import 'package:cats_home/page/cat/add/variety/index_cat_variety_list.dart';
import 'package:cats_home/page/cat/add/variety/widget_cat_variety_tag.dart';
import 'package:flutter/material.dart';

class CatVarietyPage extends StatefulWidget {
  CatVarietyPage({Key? key}) : super(key: key);

  @override
  _CatVarietyPageState createState() => _CatVarietyPageState();
}

class _CatVarietyPageState extends State<CatVarietyPage> {
  List<CatVarietyModel> catList = [];

  List<CatVarietyModel> _ListDatas = [
    CatVarietyModel('阿比希尼亚猫', 'A', '', false),
    CatVarietyModel('埃及猫', 'A', '', false),
    CatVarietyModel('奥西猫', 'A', '', false),
    CatVarietyModel('矮脚蓝猫', 'A', '', false),
    CatVarietyModel('巴厘岛猫', 'B', '', false),
    CatVarietyModel('伯曼猫', 'B', '', false),
    CatVarietyModel('串串', 'C', '', false),
    CatVarietyModel('玳瑁猫', 'D', '', false),
    CatVarietyModel('俄罗斯蓝猫', 'E', '', false),
    CatVarietyModel('俄罗斯蓝猫1', 'E', '', false),
    CatVarietyModel('俄罗斯蓝猫2', 'E', '', false),
    CatVarietyModel('俄罗斯蓝猫3', 'E', '', false),
    CatVarietyModel('俄罗斯蓝猫4', 'E', '', false),
    CatVarietyModel('俄罗斯蓝猫5', 'E', '', false),
    CatVarietyModel('俄罗斯蓝猫6', 'E', '', false),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        title: Text(
          '选择品种',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff1D1E2C)),
        ),
        leading: BackButton(
          color: Color(0xff1D1E2C),
        ),
      ),
      body: Column(
        children: [
          Container(
              width: screenWidth,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Wrap(
                  spacing: 12,
                  children: List.generate(catList.length, (index) {
                    return Chip(
                      backgroundColor: Color(0xffFFE733),
                      deleteIcon: Image.asset(
                        'lib/assets/images/cat/icon_delete.png',
                        height: 12,
                        width: 12,
                      ),
                      deleteIconColor: Colors.black,
                      label: Text(
                        catList[index].name,
                        style: TextStyle(fontSize: 12),
                      ),
                      onDeleted: () {
                        setState(() {
                          for (var item in _ListDatas) {
                            if (item == catList[index]) {
                              item.isSelected = false;
                            }
                          }
                          catList.remove(catList[index]);
                        });
                      },
                    );
                  }),
                ),
              )),
          Visibility(
            visible: (catList.length != 0),
            child: SizedBox(
              height: 12,
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: screenWidth,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: CatVarietyListView(
                            onChange: (cats) {
                              setState(() {
                                catList = cats;
                              });
                              print(cats);
                            },
                            listDatas: _ListDatas,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
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
                      setState(() {
                        for (var item in _ListDatas) {
                          for (var i in catList) {
                            if (item == i) {
                              item.isSelected = false;
                            }
                          }
                        }
                        catList.clear();
                      });
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
                        '（已选${catList.length}个）我选好了',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                      onPressed: () {
                        // widget.onSelected(selectedMap);
                        // Navigator.pop(context);
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
}
