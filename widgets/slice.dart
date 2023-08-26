// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../store_manager/refresh.dart';
import '../helpers/helpers.dart';

// helpers

class Slice<T> extends StatelessWidget {
  Slice(
      {required this.data,
      required this.builder,
      this.max,
      this.width = 150,
      this.height = 30,
      this.color = Colors.transparent,
      super.key}) {
    assert(isListNotifier(data) || isList(data));
    if (isListNotifier(data)) child = _generateRefresh();
    if (isList(data)) child = _generateStatic();
  }

  // properties
  final dynamic data;
  final Widget? Function(int, T) builder;
  final double width;
  final double height;
  final Color color;
  int? max;
  List<T>? _list;
  ValueNotifier<List<T>>? _controller;
  late final Widget child;

  // methods
  @override
  Widget build(BuildContext context) {
    return child;
  }

  Widget _generateRefresh() {
    _controller = data;

    return Refresh([_controller as Listenable], (context) {
      return Container(
        width: width,
        height: height,
        color: color,
        child: ListView.builder(
            itemCount: max ?? _controller!.value.length,
            itemBuilder: (context, index) {
              return builder(index, _controller!.value[index]);
            }),
      );
    });
  }

  Widget _generateStatic() {
    _list = data;

    return Container(
      width: width,
      height: height,
      color: color,
      child: ListView.builder(
          itemCount: max ?? _list!.length,
          itemBuilder: (context, index) {
            return builder(index, _list![index]);
          }),
    );
  }
}
