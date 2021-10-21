import 'dart:io';

import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';

class PhotosSelectView extends StatefulWidget {
  PhotosSelectView({Key? key}) : super(key: key);

  @override
  _PhotosSelectViewState createState() => _PhotosSelectViewState();
}

class _PhotosSelectViewState extends State<PhotosSelectView> {
  List<String> imgData = []; //图片list
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/cat/icon_img.png',
              height: 28,
              width: 28,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '点击上传',
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontStyle: FontStyle.normal),
            )
          ],
        ),
        onTap: () {
          uploadImages();
          // pickAsset(context, setState, imgData);
        },
      )),
    );
  }

  void uploadImages() async {
    List<Media>? res = await ImagesPicker.pick(
      count: 6 - imgData.length,
      pickType: PickType.image,
    );

    // List<AssetEntity> resultList = [];

    // try {
    //   resultList = await AssetPicker.pickAssets(
    //     context,
    //     maxAssets: 6 - imgData.length,
    //     themeColor: Theme.of(context).primaryColor,
    //     requestType: RequestType.image,
    //   );
    // } on Exception catch (e) {
    //   e.toString();
    // }
    List<String> paths = [];
    if (res == null) {
      return;
    }
    for (var item in res) {
      paths.add(item.path);
    }
    setState(() {
      imgData.addAll(paths);
    });
  }
}




/** 多图选择 */
// void pickAsset(context, setState, List imgData) async {
//   final result = await PhotoPicker.pickAsset(
//     context: context,
//     rowCount: 6 - imgData.length,
//   );

//   if (result.isNotEmpty) {
//     for (var e in result) {
//       var file = await e.file;
// //      print(file.absolute.path)
//       if (!imgData.contains(file.absolute.path)) {
//         imgData.insert(imgData.length - 1, file.absolute.path);
//       }

// //      imgData.insert(imgData.length-1, file);
// //      if (!imgData.contains(file)) {
// //        imgData.insert(imgData.length-1, file);
// //      }

//     }
//   }
//   setState(() {});
// }
