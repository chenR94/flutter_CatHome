# flutter_CatHome
a flutter Project

## Flutter开发中问题总结
小白直接手撸项目，遇到一些问题记录下来

#### 1. 在`Center`中添加`Column`不起作用

`Column`需要添加`MainAxisAlignment`属性

```dart
body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
```



#### 2. 如何设置颜色

eg:`Color(0xFF0099ff)`

- `0x`为固定
- `FF`代表透明度（16进制）
- `0099ff`代表RGB色值



#### 3. 如何显示/隐藏控件

- `Visibility()`控件中的`visible`属性可以实现控件的显示或隐藏

  - `isShow`为`bool`型，可以通过其他条件进行设定

  ```dart
  Visibility(
    child: Text('可见与不可见'),
    visible: isShow,
  ),
  ```

- 也可以在控件内通过`ifelse`条件实现控件的显示或隐藏

  ```dart
  Column(
    children: <Widget>[
       if (isShow) Text("根据show值显示或隐藏"),
       Text("始终显示"),
     ],
  )
  ```



#### 4. 无法加载图片资源 Flutter Unable to load asset

报错信息：Another exception was thrown: Unable to load asset: ‘"........"

- 在项目`pubspec.yaml`文件里，`flutter`节点下，`assets`属性内添加资源地址

  ```  dart
    assets:
      - assets/img/
      - assets/img/home_tab/
  ```

#### 5.Container 实现圆角
使用 `borderRadius`实现圆角
``` dart
Container(
    decoration: BoxDecoration(
        color: Color(0xffF7F7F7),
        borderRadius:
            BorderRadius.all(Radius.circular(15))),
),
```

#### 6.showModalBottomSheet 实现顶部圆角
使用 `backgroundColor: Colors.transparent`设置背景为透明
``` dart
showModalBottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (context) {
       return Container(
          decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(30),
                   topRight: Radius.circular(30))),
        );
  });
```

#### 7.控制台报错 Incorrect use of ParentDataWidget
导致原因：
Expanded、Flexible只能在Row、Column组件内，不能在其他组件内使用

#### 8.MaterialButton设置宽度
- 设置 `Container`  的 `padding`属性
- 设置 `MaterialButton` 的 `minWidth` 属性为 `double.infinity`
``` dart
Container(
    padding: EdgeInsets.only(left: 16, right: 16),
    alignment: Alignment.center,
    child: MaterialButton(
        minWidth: double.infinity,
        height: 44,
        color: Color(0xffFFE733),
        child: Text(
            '确定',
            style: TextStyle(fontWeight: FontWeight.bold),
        ),
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(22)),
       onPressed: () {
           Navigator.pop(context);
       },
    ),
)
```


#### 9. TextField更改选中时的图标颜色
设置 `Theme` 的颜色
```dart
return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: Color(0xff999999)),
      ),
);
```

#### 10.背景模糊化 `ImageFilter.blur`
`sigmaX` 和 `sigmaY` 分别设置了x和y方向的模糊程度
```dart
BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
    child: Container(
        color: Colors.white.withOpacity(0.5),
        height: 1000,
     ),
),
```




