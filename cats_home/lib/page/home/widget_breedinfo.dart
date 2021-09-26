import 'package:flutter/material.dart';

class BreedInfoView extends StatelessWidget {
  final String days;
  final String durtion;
  final String childBirthday;
  final String breedDay;
  final String boyName;
  final String girlName;
  final String boyImg;
  final String girlImg;

  const BreedInfoView(
      {Key? key,
      required this.days,
      required this.durtion,
      required this.childBirthday,
      required this.breedDay,
      required this.boyName,
      required this.girlName,
      required this.boyImg,
      required this.girlImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Column CatView(String icon, String name, int sex) {
      String sexImg;
      if (sex == 0) {
        sexImg = 'lib/assets/images/home/boyicon.png';
      } else {
        sexImg = 'lib/assets/images/home/girlicon.png';
      }
      return Column(children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(girlImg),
              backgroundColor: Colors.white,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                sexImg,
                height: 14,
                width: 14,
              ),
            ),
          ],
        ),
        Text(girlName),
      ]);
    }

    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    Image.asset(
                      'lib/assets/images/home/dayicon.png',
                      height: 16,
                      width: 16,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '第' + days + '天',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '距离生产还有' + durtion + '天',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  '配种时间：' + breedDay,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(191, 191, 191, 1.0),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '预产期：' + childBirthday,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(191, 191, 191, 1.0),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          Row(
            children: [
              CatView(
                boyImg,
                boyName,
                0,
              ),
              Image.asset(
                'lib/assets/images/home/love.png',
                height: 7,
                width: 19,
              ),
              CatView(
                girlImg,
                girlName,
                1,
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
