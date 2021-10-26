import 'package:cats_home/page/breed/index.dart';
import 'package:cats_home/page/cat/add/event/index.dart';
import 'package:cats_home/page/cat/add/index.dart';
import 'package:cats_home/page/cat/index.dart';
import 'package:cats_home/page/home/index.dart';
import 'package:cats_home/page/index.dart';
import 'package:cats_home/page/mine/index.dart';
import 'package:cats_home/page/search/index.dart';
import 'package:cats_home/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => IndexPage(),
    ),
    GetPage(
      name: Routes.CAT,
      page: () => CatsPage(),
    ),
    GetPage(
      name: Routes.ADDCAT,
      page: () => AddCatPage(),
    ),
    GetPage(
      name: Routes.ADDEVENT,
      page: () => AddEventPage(),
    ),
    GetPage(
      name: Routes.BREED,
      page: () => BreedPage(),
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchCatsPage(),
    ),
    GetPage(
      name: Routes.MINE,
      page: () => MinePage(),
    ),
  ];
}
