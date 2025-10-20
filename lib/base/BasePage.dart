import 'package:flutter/material.dart';

/**
 * @author <a href="https://github.com/103style">103style</a>
 * @description
 * @time 2025/9/29 14:20
 */
abstract class BasePage extends StatelessWidget {
  final String title;

  const BasePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SafeArea(child: content(context)),
    );
  }

  @protected
  Widget content(BuildContext context);
}
