import 'package:cats_home/page/home/widget_add.dart';
import 'package:cats_home/page/home/widget_breedinfo.dart';
import 'package:cats_home/page/home/widget_stack.dart';
import 'package:cats_home/page/home/widget_swiper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: SafeArea(
          top: true,
          child: Offstage(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomSwiper(
              ['lib/assets/images/home/swiper1.png'],
              index: 1,
              height: 192,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: new Row(
                children: [
                  Text(
                    "猫咪概况",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: SizedBox(),
                    fit: FlexFit.tight,
                  ),
                  Text(
                    "查看全部",
                    textAlign: TextAlign.right,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Image.asset(
                    'lib/assets/images/home/showall.png',
                    height: 12,
                    width: 12,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CatInfoView('lib/assets/images/home/card1.png', "待售", "812"),
                  CatInfoView('lib/assets/images/home/card1.png', "已预订", "812"),
                  CatInfoView('lib/assets/images/home/card1.png', "种公", "812"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 16,
                right: 16,
              ),
              child: new Row(
                children: [
                  Text(
                    "近期繁育",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: SizedBox(),
                    fit: FlexFit.tight,
                  ),
                  Text(
                    "孕猫数量：",
                    textAlign: TextAlign.right,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "3只",
                    textAlign: TextAlign.right,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 12),
              child: AddCatView(),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
              ),
              child: BreedInfoView(
                  days: '36',
                  durtion: '20',
                  childBirthday: '2021年7月10日',
                  breedDay: '2021年9月16日',
                  boyName: 'boyName',
                  girlName: 'girlName',
                  boyImg: 'lib/assets/images/home/dayicon.png',
                  girlImg: 'lib/assets/images/home/dayicon.png'),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
              ),
              child: BreedInfoView(
                  days: '36',
                  durtion: '20',
                  childBirthday: '2021年7月10日',
                  breedDay: '2021年9月16日',
                  boyName: 'boyName',
                  girlName: 'girlName',
                  boyImg: 'lib/assets/images/home/dayicon.png',
                  girlImg: 'lib/assets/images/home/dayicon.png'),
            ),
          ],
        ),
      ),
    );
  }
}
