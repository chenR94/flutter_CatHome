import 'package:cats_home/page/cat/widget_tab.dart';
import 'package:cats_home/page/cat/widget_tabbar.dart';
import 'package:flutter/material.dart';

class BreedPage extends StatefulWidget {
  var list = [CatTabModel('待生产', true), CatTabModel('已生产', false)];
  BreedPage({Key? key}) : super(key: key);

  @override
  _BreedPageState createState() => _BreedPageState();
}

class _BreedPageState extends State<BreedPage> {
  var produceList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '繁育',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(color: Colors.white, child: _buildTabBar()),
            SizedBox(
              height: 9.5,
            ),
            _buildNullView(produceList),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.list.length, (index) {
          return Expanded(
              flex: 1,
              child: InkWell(
                  child: CatTab(
                    model: CatTabModel(
                      widget.list[index].title,
                      widget.list[index].isSelected,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      print('jjjjjjjj');
                      widget.list
                          .forEach((element) => element.isSelected = false);
                      widget.list[index].isSelected = true;
                    });
                  }));
        }).toList());
  }

  List<Widget> _buildImages() {
    List<Widget> a = List.generate(widget.list.length, (index) {
      return Container(
        child: CatTab(
          model: CatTabModel(
            widget.list[index].title,
            widget.list[index].isSelected,
          ),
        ),
      );
    }).toList();
    a.add(Container(
      child: Text('sss'),
    ));
    return a;
  }

  Widget _buildNullView(List list) {
    return Visibility(
        visible: list.length == 0,
        child: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/cat/icon_null.png',
                ),
                Text(
                  '这啥也没有,快去添加猫崽子吧~',
                  style: TextStyle(fontSize: 14, color: Color(0xffBFBFBF)),
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
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ],
            ),
          ),
        ));
  }
}
