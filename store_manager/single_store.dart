import 'package:flutter/material.dart';

class _SingleStore {
  factory _SingleStore() => _instance;
  _SingleStore._private();

  /*instance properties*/
  List _providers = [];

  /*static properties*/
  static final _instance = _SingleStore._private();

  /*static methods*/
  static T find<T>() {
    for (final item in _instance._providers) {
      if (item is T) return item;
    }
    throw "<$T> no found in SingleStore!!";
  }

  static void dispatch(EventStore event) {
    for (final item in _instance._providers) {
      if (item is Redux) item.reducer(event);
    }
  }

  void providers(List providers) {
    _instance._providers.addAll(providers);
  }
}

abstract class StoreConnection {
  StoreConnection();

  /*properties*/
  List providers();

  void use() {
    _SingleStore().providers(providers());
  }
}

/*HOOKS*/
T? store<T>() => _SingleStore.find<T>();
void dispatch(EventStore event) => _SingleStore.dispatch(event);

class EventStore<T> {
  EventStore({this.playLoad});

  /*properties*/
  final T? playLoad;
}

abstract class Redux<T> extends ValueNotifier<T> {
  Redux(super.value) {
    initial = value;
  }

  /*properties*/
  late final T initial;
  /*instance methods*/
  void reducer(EventStore event);
  void reset() => value = initial;
}
