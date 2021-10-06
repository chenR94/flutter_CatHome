import 'dart:convert';

import 'package:cats_home/config/sp_key.dart';
import 'package:cats_home/utils/sp_util.dart';

class SearchService {
  static setSearchHistoryData(String key) async {
    try {
      List searchListData = json
          .decode(await SpUtil.instance.getString(PreferencesKey.SEARCH_CAT));
      // print(searchListData);
      var hasData = searchListData.any((v) {
        return v == key;
      });
      if (!hasData) {
        searchListData.insert(0, key);
        await SpUtil.instance
            .setString(PreferencesKey.SEARCH_CAT, json.encode(searchListData));
      }
    } catch (e) {
      List tempList = [];
      tempList.add(key);
      await SpUtil.instance
          .setString(PreferencesKey.SEARCH_CAT, json.encode(tempList));
    }
  }

  static getSearchHistoryData() async {
    try {
      print('getSearchHistoryData');
      List searchListData = json
          .decode(await SpUtil.instance.getString(PreferencesKey.SEARCH_CAT));
      return searchListData;
    } catch (e) {
      print('naull');
      return [];
    }
  }

  static removeSearchHistoryData() async {
    await SpUtil.instance.remove(PreferencesKey.SEARCH_CAT);
  }
}
