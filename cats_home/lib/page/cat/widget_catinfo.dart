import 'package:flutter/material.dart';

class CatInfoCell extends StatelessWidget {
  final CatInfoModel cat;
  const CatInfoCell({Key? key, required this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
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
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    this.cat.name,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Image.asset('name'),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    height: 4,
                    alignment: Alignment.center, //child居中
                    child: Text(
                      this.cat.breedType,
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontSize: 9, color: Colors.black),
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
              Row(
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
              SizedBox(
                height: 5.5,
              ),
              Row(
                children: [],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CatInfoModel {
  String name;
  String img;
  bool sex;
  String type;
  String age;
  String breedType;
  List<int> marks;
  CatInfoModel(this.name, this.img, this.sex, this.type, this.age,
      this.breedType, this.marks);
}
