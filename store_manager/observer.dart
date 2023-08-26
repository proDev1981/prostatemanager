import 'package:flutter/material.dart';
import 'consumer.dart';
import 'store_widget.dart';

class Observer<T> extends StatelessWidget {
  // contructor
  const Observer(
    this.store, {
    super.key,
    this.builder,
  });
  // properties
  final T store;
  final Widget Function(T?)? builder;

  @override
  Widget build(BuildContext context) {
    final stores = context.findAncestorWidgetOfExactType<StoreWidget>();
    if (stores != null) {
      stores.setStore(store);
    }

    if (builder != null) return Consumer<T>.rx(builder!);
    return Container();
  }
}
