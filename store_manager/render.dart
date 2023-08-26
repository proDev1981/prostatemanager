// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'consumer.dart';
import 'store_widget.dart';

class Render<T extends ValueNotifier> extends StatelessWidget {
  // construcutor
  const Render([
    this.start = "",
    this.end = "",
  ]);
  // methods
  final String start;
  final String end;
  // builder
  @override
  Widget build(BuildContext context) {
    final store = StoreWidget.of<T>(context);
    if (store is TextEditingController) {
      return Consumer<T>.rx((store) =>
          Text('$start${(store as TextEditingController).text}$end'));
    }
    return Consumer<T>.rx((store) => Text('$start${store.value}$end'));
  }
}
