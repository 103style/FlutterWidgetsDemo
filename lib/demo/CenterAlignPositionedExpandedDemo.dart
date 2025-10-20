import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/base/BasePage.dart';

/**
 * @author <a href="https://github.com/103style">103style</a>
 * @description
 * @time 2025/10/18 17:37
 */
class CenterAlignPositionedExpandedDemo extends BasePage {
  const CenterAlignPositionedExpandedDemo({super.key, required super.title});

  @override
  Widget content(BuildContext context) {
    return ListView(
      padding: EdgeInsetsDirectional.all(4),
      children: [
        Text("Center:"),
        _buildCenter(),

        Text("Algin:"),
        _buildAlgin(),

        Text("Positioned:"),
        _buildPositioned(),

        Text("Expanded:"),
        _buildExpanded(),
      ],
    );
  }

  Widget _buildCenter() {
    return Center(
      child: Text(
        "Center",
        style: TextStyle(backgroundColor: Colors.blue, color: Colors.white),
      ),
    );
  }

  Widget _buildAlgin() {
    return Column(
      children: [
        _buildAlignItem(Alignment.topLeft),
        _buildAlignItem(Alignment.topCenter),
        _buildAlignItem(Alignment.topRight),
        _buildAlignItem(Alignment.centerLeft),
        _buildAlignItem(Alignment.center),
        _buildAlignItem(Alignment.bottomLeft),
        _buildAlignItem(Alignment.centerRight),

        // 中心点是 (0,0) 左上角(-1,-1) 右下角(1,1)
        _buildAlignItem(Alignment(0.5, 0.5), 48),
        _buildAlignItem(Alignment(0.7, -0.5), 48),
        _buildAlignItem(Alignment(-0.5, 0.5), 48),
        _buildAlignItem(Alignment(-0.7, 0.5), 48),
      ],
    );
  }

  Widget _buildAlignItem(AlignmentGeometry align, [double? height = 36]) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 4),
      color: Colors.blue,
      height: height,
      child: Align(
        alignment: align,
        child: Text(
          "Align-${align.toString()}",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildPositioned() {
    return Column(
      children: [
        _buildPositionedItem(left: 0),
        _buildPositionedItem(top: 0),
        _buildPositionedItem(right: 0),
        _buildPositionedItem(bottom: 0),
        _buildPositionedItem(left: 10, top: 10),
        _buildPositionedItem(left: 100, bottom: 10),
      ],
    );
  }

  Widget _buildPositionedItem({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    var text = "";
    if (left != null) {
      text += "left:$left,";
    }
    if (top != null) {
      text += "top:$top,";
    }
    if (right != null) {
      text += "right:$right,";
    }
    if (bottom != null) {
      text += "bottom:$bottom";
    }

    return Container(
      margin: EdgeInsetsDirectional.only(top: 4),
      color: Colors.blue,
      height: 36,
      alignment: Alignment.topLeft,
      child: Stack(
        children: [
          Positioned(
            left: left,
            top: top,
            right: right,
            bottom: bottom,
            child: Text(text, style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildExpanded() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: Colors.red,
              child: Text('Text', style: TextStyle(color: Colors.white)),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Expanded Text',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Text('Text', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),

        _buildExpandedItem(),
        _buildExpandedItem(middle: 2),
        _buildExpandedItem(left: 1, middle: 2, right: 3),
      ],
    );
  }

  Widget _buildExpandedItem({int left = 1, int middle = 1, int right = 1}) {
    return Row(
      children: [
        Expanded(
          flex: left,
          child: Container(
            margin: EdgeInsetsDirectional.all(4),
            height: 36,
            color: Colors.red,
            child: Center(child: Text("flex:$left")),
          ),
        ),
        Expanded(
          flex: middle,
          child: Container(
            margin: EdgeInsetsDirectional.all(4),
            height: 36,
            color: Colors.green,
            child: Center(child: Text("flex:$middle")),
          ),
        ),
        Expanded(
          flex: right,
          child: Container(
            margin: EdgeInsetsDirectional.all(4),
            height: 36,
            color: Colors.blue,
            child: Center(child: Text("flex:$right")),
          ),
        ),
      ],
    );
  }
}
