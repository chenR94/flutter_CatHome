import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo/photo.dart';

class PhotosSelectView extends StatefulWidget {
  PhotosSelectView({Key? key}) : super(key: key);

  @override
  _PhotosSelectViewState createState() => _PhotosSelectViewState();
}

class _PhotosSelectViewState extends State<PhotosSelectView> {
  List imgData = []; //图片list
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1),
          children: _buildImagesGroup(),
        ),
      ),
    );
  }

  List<Widget> _buildImagesGroup() {
    List<Widget> a = List.generate(imgData.length, (index) {
      return Container(child: _buildImage(imgData[index]));
    }).toList();
    if (imgData.length == 6) {
      return a;
    }
    a.add(_buildAddImage());
    return a;
  }

  Widget _buildImage(String path) {
    return Container(
      height: 103,
      width: 103,
      child: Stack(
        children: [
          Image.file(
            File(path),
            height: 93,
            width: 93,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'lib/assets/images/cat/icon_checked.png',
                height: 16,
                width: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddImage() {
    return Container(
      height: 93,
      width: 93,
      color: Color(0xffF7F7F7),
      child: Center(
          child: GestureDetector(
        child: Column(
          children: [
            Image.asset(
              'name',
              height: 28,
              width: 28,
            ),
            SizedBox(
              height: 10,
            ),
            Text('点击上传')
          ],
        ),
        onTap: () {
          pickAsset(context, setState, imgData);
        },
      )),
    );
  }
}

/** 多图选择 */
void pickAsset(context, setState, List imgData) async {
  final result = await PhotoPicker.pickAsset(
    context: context,
    rowCount: 6 - imgData.length,
  );

  if (result.isNotEmpty) {
    for (var e in result) {
      var file = await e.file;
//      print(file.absolute.path)
      if (!imgData.contains(file.absolute.path)) {
        imgData.insert(imgData.length - 1, file.absolute.path);
      }

//      imgData.insert(imgData.length-1, file);
//      if (!imgData.contains(file)) {
//        imgData.insert(imgData.length-1, file);
//      }

    }
  }
  setState(() {});
}
