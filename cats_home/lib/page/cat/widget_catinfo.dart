import 'package:cats_home/page/cat/widget_tag.dart';
import 'package:flutter/material.dart';

class CatInfoCell extends StatelessWidget {
  final CatInfoModel cat;
  const CatInfoCell({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String sexImg;
    if (this.cat.sex == 0) {
      sexImg = 'lib/assets/images/home/boyicon.png';
    } else {
      sexImg = 'lib/assets/images/home/girlicon.png';
    }
    return Container(
        height: 116,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              blurRadius: 2, //阴影范围
              spreadRadius: 1, //阴影浓度
              color: Color(0xffF7F7F7), //阴影颜色
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                decoration: ShapeDecoration(
                    image: DecorationImage(
                        image: AssetImage(this.cat.img), fit: BoxFit.fitWidth),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(16))),
                width: 84,
                height: 84,
              ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text(
                          this.cat.name,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset(
                        sexImg,
                        height: 14,
                        width: 14,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        alignment: Alignment.center, //child居中
                        child: Padding(
                          padding: EdgeInsets.only(left: 3, right: 3),
                          child: Text(
                            this.cat.breedType,
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                fontSize: 9,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(4.5),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 9.5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Row(
                      children: [
                        Text(
                          this.cat.age,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          this.cat.type,
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: this
                  //       .cat
                  //       .marks
                  //       .asMap()
                  //       .keys
                  //       .map((index) => _buildMarkTags(cat.marks[index]))
                  //       .toList(),
                  // )
                ],
              )
            ],
          ),
        ));
  }

  // Widget _buildMarkTags(String mark) {
  //   return CatTypeTab(
  //     title: mark,
  //     isSeleceted: false,
  //   );
  // }
}

class CatInfoModel {
  String name;
  String img;
  int sex;
  String type;
  String age;
  String breedType;
  List<String> marks;
  CatInfoModel(this.name, this.img, this.sex, this.type, this.age,
      this.breedType, this.marks);
}
