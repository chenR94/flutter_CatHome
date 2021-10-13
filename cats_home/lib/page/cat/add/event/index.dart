import 'package:cats_home/page/cat/add/event/widget_pic_select.dart';
import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  AddEventPage({Key? key}) : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotosSelectView(),
    );
  }
}
