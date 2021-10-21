import 'dart:convert';

import 'package:cats_home/page/cat/add/event/widget_pic_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage({Key? key}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        title: Text(
          '记录事件',
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
                    Padding(
                      padding: EdgeInsets.only(top: 12, left: 16, right: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            _buildPickerGroup('猫咪名称'),
                            Container(
                              width: double.infinity,
                              height: 0.5,
                              color: Color(0xffF7F7F7),
                            ),
                            _buildPickerGroup('事件类型'),
                            Container(
                              width: double.infinity,
                              height: 0.5,
                              color: Color(0xffF7F7F7),
                            ),
                            _buildPickerGroup('发生日期'),
                            Container(
                              width: double.infinity,
                              height: 0.5,
                              color: Color(0xffF7F7F7),
                            ),
                            _buildPickerGroup('发生时间'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: _buildTextFieldGroup('事件描述'),
                    ),
                    SizedBox(
                      height: 20,
                    )
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

  Widget _buildPickerGroup(String title) {
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
              '请选择',
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

  Widget _buildTextFieldGroup(String title) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 24),
      constraints: BoxConstraints(minHeight: 337),
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
            decoration: InputDecoration.collapsed(hintText: '请输入详细描述…'),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 200),
            child: PhotosSelectView(),
          ),
          SizedBox(
            height: 20,
          ),
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
}

// child: PhotosSelectView(),
