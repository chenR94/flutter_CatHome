import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
              child: Container(
                child: SafeArea(
                    child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        '我的猫咪',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    new Row(
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        new ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: 30,
                              maxWidth: screenWidth - 32 - 32 - 40),
                          child: new TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              hintText: '输入关键词',
                              prefixIcon: Icon(Icons.search),
                              // contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: Color.fromRGBO(247, 247, 247, 1.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Image.asset(
                          'lib/assets/images/cat/icon_card.png',
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Image.asset(
                          'lib/assets/images/cat/icon_des.png',
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: TabBar(
                            tabs: [
                              Tab(
                                text: '全部',
                              ),
                              Tab(
                                text: '待售',
                              ),
                              Tab(
                                text: '已预订',
                              ),
                              Tab(
                                text: '现役种猫',
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
              ),
              preferredSize: Size.fromHeight(146)),
          body: Container(),
        ));
  }
}
