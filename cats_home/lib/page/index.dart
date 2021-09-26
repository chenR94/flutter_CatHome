import 'dart:ui';

import 'package:cats_home/page/breed/index.dart';
import 'package:cats_home/page/cat/index.dart';
import 'package:cats_home/page/home/index.dart';
import 'package:cats_home/page/mine/index.dart';
import 'package:cats_home/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main/widget_tabmenu.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with TickerProviderStateMixin {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ["猫舍", "猫咪", "繁育", "我的"];
  var currentPage;
  PageController? pageController;

  final List<Widget> tabBodies = [
    HomePage(),
    CatsPage(),
    BreedPage(),
    MinePage()
  ];

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  void initTabItemData() {
    tabImages = [
      [
        getTabImage('lib/assets/images/main/tabbar_home.png'),
        getTabImage('lib/assets/images/main/tabbar_home_highlighted.png'),
      ],
      [
        getTabImage('lib/assets/images/main/tabbar_cat.png'),
        getTabImage('lib/assets/images/main/tabbar_cat_highlighted.png'),
      ],
      [
        getTabImage('lib/assets/images/main/tabbar_breed.png'),
        getTabImage('lib/assets/images/main/tabbar_breed_highlighted.png'),
      ],
      [
        getTabImage('lib/assets/images/main/tabbar_mine.png'),
        getTabImage('lib/assets/images/main/tabbar_mine_highlighted.png'),
      ],
    ];
  }

  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.markunread_outlined,
    Icons.notifications,
  ];

  /// 子菜单是否展示
  bool isShow = false;

  /// 动画变量,以及初始化和销毁
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    pageController?.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._tabIndex = page;
    });
  }

  void _onClickBottomBar({int? index}) {
    if (!mounted) return;

    debugPrint('longer   点击了 >>> $index');

    bool isShow = false;
    if (_animationController.status == AnimationStatus.completed) {
      /// 收拢
      _animationController.reverse();
      isShow = false;
    } else {
      /// 展开
      _animationController.forward();
      isShow = true;
    }

    setState(() {
      this.isShow = isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    initTabItemData();
    final List<BottomNavigationBarItem> bottomTabs = [
      BottomNavigationBarItem(icon: getTabIcon(0), label: appBarTitles[0]),
      BottomNavigationBarItem(icon: getTabIcon(1), label: appBarTitles[1]),
      BottomNavigationBarItem(icon: Icon(null), label: ''),
      BottomNavigationBarItem(icon: getTabIcon(2), label: appBarTitles[2]),
      BottomNavigationBarItem(icon: getTabIcon(3), label: appBarTitles[3]),
    ];

    return Stack(
      children: [
        Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            children: tabBodies,
            controller: pageController,
            onPageChanged: onPageChanged,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            items: bottomTabs,
            onTap: onTap,
            currentIndex: _tabIndex,
          ),
        ),
        Visibility(
            visible: isShow,
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        //颜色不重要，主要是后面透明度
                        Color.fromRGBO(255, 255, 255, 0.0),
                        Color.fromRGBO(255, 255, 255, 1.0),
                      ],
                    ).createShader(
                        Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Scaffold(
                      backgroundColor: Colors.white,
                      body: Container(
                        height: 900,
                        width: double.maxFinite,
                      )),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                      height: 1000,
                    ),
                  ),
                ),
              ],
            )),
        Visibility(
            visible: isShow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 140, left: 28),
                  child: Text(
                    '猫舍运营\n竟如此简单',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 28),
                  child: Container(
                    width: 25,
                    height: 4,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(
                          //圆角
                          Radius.circular(2.0),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14, left: 28),
                  child: Text(
                    '快捷添加猫咪、猫孕、记录事件',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff999999),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            )),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).padding.bottom + 8.0,
          child: TabMenu(
            animation: _animation,
            tabIconsList: menuItems,
            changeIndex: (index) => _onClickBottomBar(index: index),
            opacityAnimation: _opacityAnimation,
            onClickMenu: () => _onClickBottomBar(),
            menuAnimation:
                Tween<double>(begin: 0, end: 1).animate(_animationController),
            controller: _animationController,
            isShow: isShow,
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Padding(
        //     padding: EdgeInsets.only(bottom: 12),
        //     child: FloatingActionButton(
        //       elevation: 0,
        //       backgroundColor: Colors.white,
        //       onPressed: () {
        //         _onClickBottomBar();
        //       },
        //       child: Image.asset(
        //         'lib/assets/images/main/tabbar_add.png',
        //         height: 69,
        //         width: 69,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  void onTap(int index) {
    if (index == 2) {
      return;
    } else if (index > 2) {
      index = index - 1;
    }
    pageController!.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
