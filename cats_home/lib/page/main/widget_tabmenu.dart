import 'dart:math';
import 'package:cats_home/page/cat/add/event/index.dart';
import 'package:cats_home/page/cat/add/index.dart';
import 'package:cats_home/page/cat/add/variety/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabMenu extends StatefulWidget {
  final Function(int index) changeIndex;
  final Function onClickMenu;
  final List<IconData> tabIconsList;
  final Animation<double> animation;
  final Animation<double> opacityAnimation;
  final Animation<double> menuAnimation;
  final AnimationController controller;
  final bool isShow;

  TabMenu({
    Key? key,
    required this.changeIndex,
    required this.tabIconsList,
    required this.animation,
    required this.opacityAnimation,
    required this.onClickMenu,
    required this.menuAnimation,
    required this.controller,
    required this.isShow,
  }) : super(key: key);

  @override
  _TabMenuState createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  List<String> menuTitles = ['添加猫咪', '添加孕猫', '记录事件'];
  List<Color> menuColors = [
    Color(0xffFFE60F),
    Color(0xffFE6F93),
    Color(0xff668AFE)
  ];
  List<String> menuImgs = [
    'lib/assets/images/main/menu_cat.png',
    'lib/assets/images/main/menu_catmom.png',
    'lib/assets/images/main/menu_thing.png',
  ];
  Widget _buildFlowChildren(int index, IconData icon) {
    return Column(
      children: [
        RawMaterialButton(
          fillColor: menuColors[index],
          shape: const CircleBorder(),
          constraints: BoxConstraints.tight(Size(64, 64)),
          child: Image.asset(
            menuImgs[index],
            height: 32,
            width: 32,
            alignment: Alignment.center,
          ),
          onPressed: () => _onClickMenuIcon(index, icon),
        ),
        SizedBox(
          height: 6.5,
        ),
        Text(
          menuTitles[index],
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.none,
          ),
        )
      ],
    );
  }

  void _onClickMenuIcon(int index, IconData icon) {
    if (index == 0) {
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return new AddCatPage();
        }));
      });
    } else {
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return new AddEventPage();
        }));
      });
    }

    // 回传消息
    widget.changeIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Color(0xffFEE648), Color(0xffEEEEEE)];
    List<String> icons = [
      'lib/assets/images/main/tabbar_add.png',
      'lib/assets/images/main/tabbar_close.png'
    ];
    int index;
    if (widget.isShow) {
      index = 1;
    } else {
      index = 0;
    }
    return Container(
      height: 160,
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// 弹出的菜单
          Positioned.fill(
            child: Flow(
              clipBehavior: Clip.none,
              delegate:
                  FlowAnimatedCircle(widget.animation, widget.opacityAnimation),
              children: widget.tabIconsList
                  .asMap()
                  .keys
                  .map((index) =>
                      _buildFlowChildren(index, widget.tabIconsList[index]))
                  .toList(),
            ),
          ),

          /// 菜单按钮
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RawMaterialButton(
                fillColor: colors[index],
                shape: const CircleBorder(),
                constraints: BoxConstraints.tight(Size(64, 64)),
                child: RotationTransition(
                  alignment: Alignment.center,
                  turns: widget.controller,
                  child: IconButton(
                    iconSize: 64,
                    onPressed: () => widget.onClickMenu(),
                    icon: Image.asset(
                      icons[index],
                      height: 64,
                      width: 64,
                    ),
                  ),
                ),
                onPressed: () => widget.onClickMenu(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlowAnimatedCircle extends FlowDelegate {
  final Animation<double> animation;
  final Animation<double> opacityAnimation;

  /// icon 尺寸
  final double iconSize = 64.0;

  /// 菜单左右边距
  final paddingHorizontal = 80.0;

  FlowAnimatedCircle(this.animation, this.opacityAnimation)
      : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    // debugPrint('longer   context.size >>> ${context.size}');

    // 等于0，也就是收起来的时候不绘制
    final progress = animation.value;
    if (progress == 0) return;

    final xRadius = context.size.width / 2 - paddingHorizontal;
    final yRadius = context.size.height - iconSize;

    // 开始(0,0)在父组件的中心
    double x = 0;
    double y = 0;

    final total = context.childCount + 1;

    for (int i = 0; i < context.childCount; i++) {
      x = progress * cos(pi * (total - i - 1) / total) * xRadius;
      y = progress * sin(pi * (total - i - 1) / total) * yRadius;

      // 使用Matrix定位每个子组件
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          x,
          -y + (context.size.height / 2) - (iconSize / 2),
          0,
        ),
        opacity: opacityAnimation.value * progress * progress,
      );
    }
  }

  @override
  bool shouldRepaint(FlowAnimatedCircle oldDelegate) => false;
}
