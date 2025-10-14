import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
    return ListView(
      children: [
        // 1.DefaultTextStyle
        style(_createDefaultTextStyle()),

        // 2.RichText
        // 2.1 颜色、粗细、字体、大小、样式
        style(_createRichText(context)),
        // 2.2 文字整体居中
        style(_createAlginRichText(context)),
        // 2.2 LinkText
        style(_createLinkText(context)),
        // 2.3 Insert Emoji or Widget
        style(_createEmojiOrWidgetText(context)),

        // 3.SelectableText
        style(_buildSelectableText(context)),
      ],
    );
  }

  Widget _createDefaultTextStyle() {
    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      child: const Center(
        child: Text(
          'use DefaultTextStyle, fontSize is 20, font Weight is bold, overflow is ellipsis, 103style103style103style103style103style103style',
        ),
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _createRichText(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'default text ',
        style: TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: 'Bold ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Red ',
            style: TextStyle(color: Colors.red),
          ),
          TextSpan(text: 'Size 30 ', style: TextStyle(fontSize: 30)),
          TextSpan(
            text: 'italic ',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          TextSpan(
            text: 'letterSpacing1.5、',
            style: TextStyle(letterSpacing: 1.5),
            children: [
              TextSpan(
                text: 'letterSpacing3',
                style: TextStyle(letterSpacing: 3),
              ),
            ],
          ),
        ],
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }

  Widget _createAlginRichText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle, // 关键点！
            child: Text(
              '12号字',
              style: TextStyle(fontSize: 12, color: Colors.blue),
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle, // 关键点！
            child: Text(
              '20号字',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle, // 关键点！
            child: Text(
              '30号字',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ),
        ],
      ),
      strutStyle: StrutStyle(
        fontSize: 20, // 基准字号
        height: 1.2, // 行高系数
        leading: 0.5, // 可选：额外行间距
      ),
    );
  }

  Widget _createLinkText(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'click it: ',
        style: TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: 'click span or web link',
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('click link');
              },
          ),
        ],
      ),
      selectionRegistrar: SelectionContainer.maybeOf(context),
      selectionColor: const Color(0xAF6694e8),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }

  Widget _createEmojiOrWidgetText(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "I love",
        children: [
          WidgetSpan(child: Icon(Icons.star, color: Colors.amber, size: 20)),
          TextSpan(text: ' Flutter'),
          WidgetSpan(child: Icon(Icons.star, color: Colors.amber, size: 20)),
        ],
      ),
    );
  }

  Widget _buildSelectableText(BuildContext context) {
    return Column(
      children: [
        const SelectableText(
          'selectable text test, long click me, then select me',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SelectableText.rich(
          TextSpan(
            text: 'Hello', // default text style
            children: <TextSpan>[
              const TextSpan(
                text: ' beautiful ',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              const TextSpan(
                text: 'world',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' link',
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('click link');
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget style(Widget child) {
    return Container(
      color: Colors.black12,
      margin: EdgeInsetsDirectional.all(4),
      padding: EdgeInsetsDirectional.all(4),
      child: child,
    );
  }
}
