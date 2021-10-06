import 'package:cats_home/services/search_service.dart';
import 'package:flutter/material.dart';

class SearchCatsPage extends StatefulWidget {
  SearchCatsPage({Key? key}) : super(key: key);

  @override
  _SearchCatsPageState createState() => _SearchCatsPageState();
}

class _SearchCatsPageState extends State<SearchCatsPage> {
  var keyword;
  List _keywords = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getHistoryData();
  }

  _getHistoryData() async {
    var _historyListData = await SearchService.getSearchHistoryData();
    setState(() {
      this._keywords = _historyListData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        title: Text(
          '搜索',
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
        color: Color(0xffFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 54,
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: new ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 30,
                        ),
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
                          onChanged: (value) {
                            print('object: $value');
                            this.keyword = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      child: GestureDetector(
                        child: Text(
                          '搜索',
                          style:
                              TextStyle(color: Color(0xff999999), fontSize: 14),
                        ),
                        onTap: () {
                          print('搜索');
                          print(this.keyword);
                          SearchService.setSearchHistoryData(this.keyword);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      '历史搜索',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1D1E2C)),
                    ),
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      child: Image.asset(
                        'lib/assets/images/search/icon_delete.png',
                        height: 20,
                        width: 20,
                      ),
                      onTap: () {
                        SearchService.removeSearchHistoryData();
                        _getHistoryData();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Wrap(
                spacing: 15,
                runSpacing: 12,
                alignment: WrapAlignment.start,
                children: _keywords
                    .map<Widget>((e) => GestureDetector(
                          child: Chip(
                            label: Text(
                              e,
                              style: TextStyle(color: Color(0xff999999)),
                            ),
                            backgroundColor: Color(0xffF7F7F7),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '- 我是有底线的 -',
                style: TextStyle(fontSize: 12, color: Color(0xff999999)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
