import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:image_picker/image_picker.dart';

import '../widget_tab.dart';
import '../widget_tag.dart';

class AddCatPage extends StatefulWidget {
  AddCatPage({Key? key}) : super(key: key);

  @override
  _AddCatPageState createState() => _AddCatPageState();
}

class _AddCatPageState extends State<AddCatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _picker = ImagePicker();
  var _image;
  Map<String, List<CatTabModel>> map = {
    '性别': [
      CatTabModel('不确定', false),
      CatTabModel('男孩', false),
      CatTabModel('女孩', false),
    ],
    '是否种猫': [
      CatTabModel('退役种猫', false),
      CatTabModel('现役种猫', false),
      CatTabModel('非种猫', false),
    ],
    '是否绝育': [
      CatTabModel('未绝育', false),
      CatTabModel('已绝育', false),
    ],
    '血型': [
      CatTabModel('未知', false),
      CatTabModel('A', false),
      CatTabModel('B', false),
      CatTabModel('AB', false),
    ],
    '被毛类型': [
      CatTabModel('未知', false),
      CatTabModel('短毛', false),
      CatTabModel('长毛', false),
      CatTabModel('无毛', false),
    ],
    '状态': [
      CatTabModel('待售', false),
      CatTabModel('已预订', false),
      CatTabModel('已售出', false),
      CatTabModel('不出售', false),
    ]
  };

  Future getImage() async {
    var image = await _picker.getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  getLocalImage() async {
    var image = await _picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        title: Text(
          '添加猫咪',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff1D1E2C)),
        ),
        leading: BackButton(
          color: Color(0xff1D1E2C),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 34,
                    ),
                    GestureDetector(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          _ImageView(_image),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Image.asset(
                              'lib/assets/images/cat/icon_camera.png',
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        getLocalImage();
                      },
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                            _buildInputGroup('姓名', '请输入猫咪姓名'),
                            Container(
                              width: double.infinity,
                              height: 0.5,
                              color: Color(0xffF7F7F7),
                            ),
                            _buildPickerGroup('品种', '请选择'),
                            Container(
                              width: double.infinity,
                              height: 0.5,
                              color: Color(0xffF7F7F7),
                            ),
                            _buildPickerGroup('生日', '请选择'),
                            Container(
                              width: double.infinity,
                              height: 0.5,
                              color: Color(0xffF7F7F7),
                            ),
                            _buildInputGroup('体重', '请输入猫咪姓名'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildChoiceGroup('性别'),
                            _buildChoiceGroup('是否种猫'),
                            _buildChoiceGroup('是否绝育'),
                            _buildChoiceGroup('血型'),
                            _buildChoiceGroup('被毛类型'),
                            _buildChoiceGroup('状态'),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Column(
                          children: [
                            _buildPickerGroup('级别', '未定级'),
                            Container(
                              width: double.infinity,
                              height: 0.5,
                              color: Color(0xffF7F7F7),
                            ),
                            _buildInputGroup('价格', '请输入猫咪姓名'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: _buildTextFieldGroup('简介', '请输入简介…'),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: _buildTextFieldGroup('备注', '请输入备注…'),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              alignment: Alignment.center,
              child: MaterialButton(
                minWidth: double.infinity,
                height: 44,
                color: Color(0xffFFE733),
                child: Text(
                  '完成',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              height: 64,
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
      ),
    );
  }

  Widget _buildTextFieldGroup(String title, String hint) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 24),
      height: 180,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          TextField(
            style: TextStyle(fontSize: 14),
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration.collapsed(hintText: hint),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _buildChoiceGroup(String title) {
    List<CatTabModel> models = this.map[title]!;
    return Container(
      height: 85,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 23,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 13,
          ),
          Wrap(
            spacing: 18.5,
            children: List.generate(models.length, (index) {
              return GestureDetector(
                child: CatTypeTab(
                  model: models[index],
                ),
                onTap: () {
                  setState(() {
                    // selectedMap[title] = index;
                    models.forEach((element) => element.isSelected = false);
                    models[index].isSelected = true;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildInputGroup(String title, String hint) {
    return Container(
      height: 64,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Text(title),
          Flexible(
            child: SizedBox(),
            fit: FlexFit.tight,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 48),
            child: IntrinsicWidth(
              child: TextField(
                textAlign: TextAlign.end,
                decoration: InputDecoration.collapsed(hintText: hint),
              ),
            ),
          )
          // TextField(
          //   textAlign: TextAlign.end,
          //   style: TextStyle(fontSize: 14),
          //   maxLines: 1,
          //   decoration: InputDecoration.collapsed(hintText: hint),
          // ),
        ],
      ),
    );
  }

  Widget _buildPickerGroup(String title, String hint) {
    return Container(
      height: 65,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Text(title),
          Flexible(
            child: SizedBox(),
            fit: FlexFit.tight,
          ),
          GestureDetector(
            child: Text(
              hint,
              style: TextStyle(color: Color(0xffBFBFBF), fontSize: 14),
            ),
            onTap: () {
              showPicker(context);
            },
          ),
          Image.asset(
            'lib/assets/images/cat/icon_touch.png',
            height: 20,
            width: 20,
          )
        ],
      ),
    );
  }

  showPicker(BuildContext context) {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert('["a","b","c","d","e","f"]')),
        changeToFirst: false,
        textAlign: TextAlign.left,
        textStyle: TextStyle(color: Colors.blue),
        selectedTextStyle: TextStyle(color: Colors.red),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        });
    picker.showModal(context);
  }

  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('lib/assets/images/cat/icon_boy.png'),
        backgroundColor: Colors.white,
      );
    } else {
      return ClipOval(
        child: Image.file(
          File(_image.path),
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
      );
    }
  }
}
