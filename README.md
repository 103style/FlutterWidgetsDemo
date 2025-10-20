# FlutterWidgetsDemo
show how to use flutter widgets.

## Layout
* [Row、Column、Stack](https://github.com/103style/FlutterWidgetsDemo/blob/master/lib/demo/Layout.dart)
* [Container、SizedBox](https://github.com/103style/FlutterWidgetsDemo/blob/master/lib/demo/ContainerAndSizedBoxDemo.dart)
* [Center、Align、Positioned、Expanded](https://github.com/103style/FlutterWidgetsDemo/blob/master/lib/demo/CenterAlignPositionedExpandedDemo.dart)
  * 对于 `Alignment(0.5, 0.5)`, 中心点是 `(0,0)`、左上角`(-1,-1)`、右下角`(1,1)`。
    ![Alignment](https://github.com/103style/FlutterWidgetsDemo/blob/master/pic/image.jpg)
  * `Positioned(left:, top:, right:, bottom:)` 只能在`Stack`中使用
    * left     距离父容器左侧的距离 
    * top	   距离父容器顶部的距离 
    * right    距离父容器右侧的距离 
    * bottom   距离父容器底部的距离
    * 只指定 left 和 top	固定左上角的位置
    * 指定 left、top、width	固定大小 + 定位
    * **同时指定 left 和 right	横向拉伸到两侧（不能再指定 width）**
    * **同时指定 top 和 bottom	纵向拉伸到两边（不能再指定 height）**
    * **同时指定 left、right、top、bottom	组件会完全拉伸到父容器（充满 Stack）**
    * 指定 width、height	固定大小，不拉伸

## Widgets
* [DefaultTextStyle、RichText、Text、SelectableText](https://github.com/103style/FlutterWidgetsDemo/blob/master/lib/demo/Text.dart)
* [Image、Icon、IconButton、Ink、FadeInImage](https://github.com/103style/FlutterWidgetsDemo/blob/master/lib/demo/ImageDemo.dart)
  ```
  # 本地资源配置 pubspec.yaml  
  flutter:
    #  assets 配置
    #  1. 目录结尾一定要有 /； 2.YAML 缩进必须正确（2 个空格，不可用 tab）。
    assets:
      - assets/images/
  ```
* [TextFiled](https://github.com/103style/FlutterWidgetsDemo/blob/master/lib/demo/TextFiledDemo.dart)
* ElevatedButton、FilledButton、OutlinedButton、TextButton、 FloatingActionButton

* ListView、GridView
* SliverList&SliverGrid
* LayoutBuilder
* ListView.builder、GridView.builder、Builder、LayoutBuilder、FutureBuilder

* Form
* SegmentedButton
* ClipRRect、ClipXXX...、
* FittedBox
* Chip
* Checkbox、Switch、 Radio、ListTile
* CheckboxListTile、SwitchListTile

* Opacity、BackdropFilter 、Transform

* PageView
* Table、TableRow
* SliverAppBar
* Hero
* AbsorbPointer
* Scaffold、AppBar
* DropDownMenu、Slider
* DatePickerDialog、TimePickerDialog
* Dismissible
* StreamBuilder
* CustomPaint
* ToolTips
* AnimatedBuilder