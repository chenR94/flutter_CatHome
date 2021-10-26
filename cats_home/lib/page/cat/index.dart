import 'package:cats_home/Routes.dart';
import 'package:cats_home/apppages.dart';
import 'package:cats_home/page/cat/widget_catinfo.dart';
import 'package:cats_home/page/cat/widget_choice_context.dart';
import 'package:cats_home/page/cat/widget_sort_context.dart';
import 'package:cats_home/page/cat/widget_tab.dart';
import 'package:cats_home/page/cat/widget_tabbar.dart';
import 'package:cats_home/page/search/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CatsPage extends StatelessWidget {
  const CatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = [
      CatInfoModel('name', 'lib/assets/images/cat/test01.jpg', 0, 'type', '2',
          'breedType', ['marks'])
    ];

    var _refreshController = new RefreshController(initialRefresh: false);
    void _onRefresh() async {
      // monitor network fetch
      await Future.delayed(Duration(milliseconds: 1000));
      // if failed,use refreshFailed()
      _refreshController.refreshCompleted();
    }

    void _onLoading() async {
      // monitor network fetch
      await Future.delayed(Duration(milliseconds: 1000));
      // if failed,use loadFailed(),if no data return,use LoadNodata()
      list.add((list.length + 1).toString());
      _refreshController.loadComplete();
    }

    double screenWidth = MediaQuery.of(context).size.width;
    //输入框控制器，一般用于获取文本、修改文本等
    TextEditingController _inputController = TextEditingController();
    //焦点节点，一般用于自动获取焦点，取消焦点以便隐藏键盘等
    FocusNode _inputFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的猫咪',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xffF7F7F7),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.white,
              child: new Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'lib/assets/images/cat/icon_search.png',
                              height: 16,
                              width: 16,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '输入关键词',
                              style: TextStyle(
                                  fontSize: 13, color: Color(0xff999999)),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffF7F7F7),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      onTap: () {
                        Get.toNamed(Routes.SEARCH);
                        // Navigator.push(context,
                        //     CupertinoPageRoute(builder: (context) {
                        //   return new SearchCatsPage();
                        // }));
                      },
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset(
                    'lib/assets/images/cat/icon_card.png',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'lib/assets/images/cat/icon_des.png',
                      height: 20,
                      width: 20,
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 290,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              child: CatSortView(),
                            );
                          });
                    },
                  ),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 16, top: 12),
                child: Row(
                  children: [
                    CatTabBar(
                      models: [
                        CatTabModel('全部', true),
                        CatTabModel('待售', false),
                        CatTabModel('已预订', false),
                        CatTabModel('现役种猫', false)
                      ],
                      onChange: (index) {},
                    ),
                    Flexible(
                      child: SizedBox(),
                      fit: FlexFit.tight,
                    ),
                    Container(
                      width: 0.5,
                      height: 16,
                      decoration: BoxDecoration(color: Color(0xffEEEEEE)),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    InkWell(
                      child: Row(
                        children: [
                          Text(
                            '筛选',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            'lib/assets/images/cat/icon_option.png',
                            height: 16,
                            width: 16,
                          )
                        ],
                      ),
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                height: 520,
                                child: CatSelectedContent(
                                  modelMap: {
                                    '是否种猫': [
                                      CatTabModel('退役种猫', false),
                                      CatTabModel('现役种猫', false),
                                      CatTabModel('非种猫', false)
                                    ],
                                    '是否绝育': [
                                      CatTabModel('未绝育', false),
                                      CatTabModel('已绝育', false),
                                    ],
                                    '性别': [
                                      CatTabModel('不确定', false),
                                      CatTabModel('弟弟', false),
                                      CatTabModel('妹妹', false)
                                    ],
                                    '状态': [
                                      CatTabModel('待售', false),
                                      CatTabModel('已预订', false),
                                      CatTabModel('已售出', false),
                                      CatTabModel('不出售', false)
                                    ]
                                  },
                                  onSelected: (Map map) {
                                    print(map);
                                  },
                                ),
                              );
                            });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Visibility(
                        visible: list.length == 0,
                        child: Container(
                            decoration: BoxDecoration(color: Color(0xffF7F7F7)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/cat/icon_null.png',
                                  ),
                                  Text(
                                    '这啥也没有,快去添加猫崽子吧~',
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xffBFBFBF)),
                                  ),
                                  SizedBox(
                                    height: 36,
                                  ),
                                  MaterialButton(
                                    color: Colors.yellow,
                                    onPressed: () {
                                      print('登陆');
                                    },
                                    child: Text(
                                      '去添加',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),

                                    ///圆角
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                  ),
                                ],
                              ),
                            ))),
                    SmartRefresher(
                      onRefresh: _onRefresh,
                      onLoading: _onLoading,
                      controller: _refreshController,
                      enablePullDown: true,
                      enablePullUp: true,
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new Container(
                            padding: const EdgeInsets.all(16.0),
                            child: new CatInfoCell(cat: list[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
