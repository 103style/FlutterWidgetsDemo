import 'package:flutter/cupertino.dart';
import 'package:flutter_widgets_demo/base/BasePage.dart';

/**
 * @author <a href="https://github.com/103style">103style</a>
 * @description
 * @time 2025/9/29 14:21
 */
class TextDemoPage extends BasePage {
  const TextDemoPage({super.key, required super.title});

  @override
  Widget content(BuildContext context) {
    return Text("TextDemoPage");
  }
}
