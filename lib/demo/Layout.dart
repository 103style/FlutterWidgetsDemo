import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/base/BasePage.dart';

/**
 * @author <a href="https://github.com/103style">103style</a>
 * @description
 * @time 2025/10/10 11:37
 */
class LayoutDemoPage extends BasePage {
  const LayoutDemoPage({required super.title});

  @override
  Widget content(BuildContext context) {
    return ListView(
      children: [
        _buildRow(),
        SizedBox(height: 8),
        _buildColumn(),
        SizedBox(height: 8),
        _buildStack(),
        SizedBox(height: 8),
        _buildCenter(),
        SizedBox(height: 8),
      ],
    );
  }

  /// 水平布局
  Widget _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // 主轴， 水平方向
      crossAxisAlignment: CrossAxisAlignment.center, // 交叉轴，垂直方向
      children: [
        Padding(padding: EdgeInsetsDirectional.all(2), child: Text("Text1")),
        Container(padding: EdgeInsetsDirectional.all(4), child: Text("Text2")),
        Positioned(left: 8, right: 8, child: Text("Text3")),
      ],
    );
  }

  /// 垂直布局
  Widget _buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end, // 主轴， 垂直方向
      crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴，水平方向
      children: [
        Padding(padding: EdgeInsetsDirectional.all(2), child: Text("Text1")),
        Container(padding: EdgeInsetsDirectional.all(4), child: Text("Text2")),
        Positioned(top: 8, bottom: 8, child: Text("Text3")),
      ],
    );
  }

  /// 层叠布局
  Widget _buildStack() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(start: 2, top: 2),
          child: Text(
            "Text1",
            style: TextStyle(backgroundColor: Colors.blue.shade50),
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.only(start: 10, top: 4),
          child: Text(
            "Text2",
            style: TextStyle(backgroundColor: Colors.red.shade50),
          ),
        ),
        Positioned(
          top: 8,
          left: 20,
          child: Text(
            "Text3",
            style: TextStyle(backgroundColor: Colors.green.shade50),
          ),
        ),
      ],
    );
  }

  /// 对齐方式
  Widget _buildCenter() {
    return Column(
      children: [
        Center(child: Text("Center")),
        Align(
          alignment: AlignmentDirectional.center,
          child: Text("Align center"),
        ),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text("Align topStart"),
        ),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Text("Align bottomEnd"),
        ),
        Positioned(left: 12, top: 12, child: Text("Positioned")),
      ],
    );
  }
}
