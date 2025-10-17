import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;
import 'package:flutter_widgets_demo/base/BasePage.dart';

/**
 * @author <a href="https://github.com/103style">103style</a>
 * @description
 * @time 2025/10/14 21:48
 */
class TextFiledDemo extends BasePage {
  const TextFiledDemo({super.key, required super.title});

  @override
  Widget content(BuildContext context) {
    return _TextFiledDemo();
  }
}

class _TextFiledDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextFiledStateDemo();
}

class _TextFiledStateDemo extends State<_TextFiledDemo> {
  late TextEditingController _textEditingController;

  String showText = "";
  FocusNode softFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsetsDirectional.all(8),
      children: [
        // 最大最小显示行数 控制显示区域的高度
        TextField(
          maxLines: 2,
          minLines: 1,
          decoration: InputDecoration(
            hintText: 'maxLines:2, minLines:1',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),

        TextField(
          keyboardType: TextInputType.phone, // 限制输入为电话
          maxLength: 11, // 限制长度为11位
          decoration: InputDecoration(
            hintText: "input type phone, max length is 11",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),

        TextField(
          obscureText: true, // 文本不可见
          decoration: InputDecoration(
            labelText: 'Password labelText',
            hintText: 'Password',
            labelStyle: TextStyle(color: Colors.blue),
          ),
        ),

        TextField(
          // TextCapitalization.words, // 单词首字母大写
          // TextCapitalization.sentences, // 句子首字母大写
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: "textCapitalization: sentences",
          ),
        ),

        Container(
          padding: EdgeInsetsDirectional.all(16),
          child: TextField(
            decoration: InputDecoration.collapsed(hintText: "去掉下划线的输入框"),
          ),
        ),

        Container(
          padding: EdgeInsetsDirectional.only(top: 8, bottom: 8),
          child: TextField(
            decoration: InputDecoration(
              hintText: '有边框的输入框',
              labelText: '圆角边框的输入框 labelText',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
          ),
        ),

        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.mail),
            prefixIcon: Icon(Icons.add),
            suffixIcon: IconButton(icon: Icon(Icons.remove), onPressed: () {}),
          ),
          onChanged: (value) => showText = value,
        ),

        // 执行先后顺序  onChanged、onEditingComplete、onSubmitted
        TextField(
          decoration: InputDecoration(
            labelText: "onChanged/onEditingComplete/onSubmitted",
          ),
          controller: _textEditingController,
          textInputAction: TextInputAction.done,
          onChanged: (value) => print(value),
          onEditingComplete: () => print("onEditingComplete"),
          onSubmitted: (value) => print("onSubmit:$value"),
        ),

        // 关闭键盘
        TextField(
          focusNode: softFocus,
          decoration: InputDecoration(
            hintText: '点击-去掉焦点',
            prefixIcon: IconButton(
              onPressed: () {
                softFocus.unfocus();
              },
              icon: Icon(Icons.remove),
            ),
          ),
        ),

        // 自定义输入规则
        TextField(
          // inputFormatters: [LengthLimitingTextInputFormatter(12)],
          controller: _textEditingController,
          inputFormatters: [_CustomTextInputFormatter()],
          decoration: InputDecoration(
            labelText: '自定义输入规则示例',
            icon: IconButton(
              onPressed: () {
                _textEditingController.clear();
              },
              icon: Icon(Icons.remove),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomTextInputFormatter extends TextInputFormatter {
  TextEditingValue? beforeValue;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    beforeValue = newValue;

    String txt = beforeValue?.text ?? '';
    return TextEditingValue(text: "$txt${txt.length}");
  }
}
