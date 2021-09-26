import 'package:cats_home/page/cat/widget_tab.dart';
import 'package:cats_home/page/cat/widget_tabbar.dart';
import 'package:flutter/material.dart';

class CatsPage extends StatelessWidget {
  const CatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = [];
    double screenWidth = MediaQuery.of(context).size.width;
    //输入框控制器，一般用于获取文本、修改文本等
    TextEditingController _inputController = TextEditingController();
    //焦点节点，一般用于自动获取焦点，取消焦点以便隐藏键盘等
    FocusNode _inputFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的猫咪',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            new Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                new ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: 30, maxWidth: screenWidth - 32 - 32 - 40),
                  child: new TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                      hintText: '输入关键词',
                      prefixIcon: Icon(Icons.search),
                      // contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Color.fromRGBO(247, 247, 247, 1.0),
                    ),
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
                Image.asset(
                  'lib/assets/images/cat/icon_des.png',
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
            Padding(
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
            ),
            Expanded(
              flex: 2,
              child: Visibility(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                            ),
                          ],
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
