import 'package:flutter/material.dart';
import '../store_manager/refresh.dart';
import 'store_widget.dart';

// ignore: must_be_immutable
class Consumer<T> extends StatelessWidget {
  Consumer.store(this.sbuilder, {super.key}) {
    _rx = false;
    builder = null;
  }
  Consumer(this.builder, {super.key}) {
    _rx = false;
    sbuilder = null;
  }
  Consumer.rx(this.builder, {super.key}) {
    _rx = true;
    sbuilder = null;
  }
  // properties
  late final bool _rx;
  late final Widget Function(T)? builder;
  late final Widget Function(StoreWidget)? sbuilder;
  T? data;
  // methods
  void getData(BuildContext context) {
    final store = getStore(context);
    if (store != null) {
      for (final item in store.getStores()) {
        if (item is T) {
          data = item;
        }
      }
      AssertionError("Data with type $T not found !!");
    }
  }

  StoreWidget? getStore(BuildContext constext) {
    return constext.findAncestorWidgetOfExactType<StoreWidget>();
  }

  // builder
  @override
  Widget build(BuildContext context) {
    if (builder != null) {
      getData(context);
      if (_rx)
        return Refresh([data as Listenable], (context) => builder!(data as T));
      return builder!(data as T);
    }
    return sbuilder!(getStore(context)!);
  }
}
