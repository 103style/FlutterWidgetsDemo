import 'package:flutter/material.dart';
import 'package:flutter_widgets_demo/base/BasePage.dart';
import 'package:flutter_widgets_demo/demo/Layout.dart';
import 'package:flutter_widgets_demo/demo/Text.dart' show TextDemoPage;

import 'demo/ImageDemo.dart' show ImageDemo;
import 'demo/TextFiledDemo.dart' show TextFiledDemo;

void main() {
  runApp(const MyApp());
}

var pageRouters = <String, WidgetBuilder>{
  'TextDemo': (context) => const TextDemoPage(title: "TextDemo"),
  'ImageDemo': (context) => const ImageDemo(title: "ImageDemo"),
  'TextFiledDemo': (context) => const TextFiledDemo(title: "TextFiledDemo"),
  'LayoutDemo': (context) => const LayoutDemoPage(title: "LayoutDemo"),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: pageRouters,
      home: const MyHomePage(title: 'FlutterWidgetsDemo'),
    );
  }
}

class MyHomePage extends BasePage {
  const MyHomePage({super.key, required super.title});

  @override
  Widget content(BuildContext context) {
    return Center(
      child: ListView(
        children: pageRouters.entries.map((it) {
          return Container(
            margin: EdgeInsetsDirectional.all(8),
            color: Colors.black,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(it.key);
              },
              child: Text(it.key, style: TextStyle(color: Colors.white)),
            ),
          );
        }).toList(),
      ),
    );
  }
}
