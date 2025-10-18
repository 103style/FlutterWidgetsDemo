import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/base/BasePage.dart';

/**
 * @author <a href="https://github.com/103style">103style</a>
 * @description
 * @time 2025/10/18 11:25
 */
class ContainerAndSizedBoxDemo extends BasePage {
  const ContainerAndSizedBoxDemo({super.key, required super.title});

  @override
  Widget content(BuildContext context) {
    return ListView(
      children: [
        _buildContainerDemo(),

        SizedBox(height: 16), // 当作 margin or padding

        _buildSizedBoxDemo(),
      ],
    );
  }

  Widget _buildContainerDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Container: color、padding、margin"),
        Container(child: Text("1.default")),
        Container(
          color: Colors.pink,
          padding: EdgeInsetsDirectional.all(4),
          margin: EdgeInsetsDirectional.all(8),
          child: Text(
            "2.with color、padding、margin",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
          child: Text("3.with decoration"),
        ),
        Container(
          padding: EdgeInsetsDirectional.all(48),
          decoration: BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
          child: Text("4.decoration+padding"),
        ),
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            "5.with alignment center",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        Container(
          color: Colors.red,
          height: 50,
          width: 300,
          margin: EdgeInsetsDirectional.only(start: 16, end: 16),
          alignment: AlignmentDirectional.center,
          padding: EdgeInsetsDirectional.all(8),
          transform: Matrix4.rotationZ(0.05),
          child: Text(
            "6.with rotationZ transform",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildSizedBoxDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("SizedBox:"),

        Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: 200,
            height: 36,
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                "exactly size, w:200 h:36",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),

        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {},
            child: Text("width: double.infinity"),
          ),
        ),
      ],
    );
  }
}
