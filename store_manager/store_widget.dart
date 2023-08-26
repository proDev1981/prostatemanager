// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StoreWidget<T> extends StatelessWidget {
  // properties
  late List? stores;
  final Widget child;
  // constructor
  StoreWidget({this.stores, required this.child, super.key}) {
    stores = stores ??= [];
  }
  // methods
  List getStores() => stores!;
  void setStore(T store) => stores!.add(store);
  A find<A>() {
    A? store;
    for (final item in stores!) {
      if (item is A) return item;
    }
    return store as A;
  }

  // static methods
  static T add<T>(BuildContext context) {
    T? store;
    final stores = context.findAncestorWidgetOfExactType<StoreWidget>();
    if (stores != null) stores.setStore(store);
    return store as T;
  }

  static T of<T>(BuildContext context) {
    T? store;
    final stores = context.findAncestorWidgetOfExactType<StoreWidget>();
    if (stores != null) {
      for (final item in stores.getStores()) {
        if (item is T) store = item;
      }
    }
    return store as T;
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
