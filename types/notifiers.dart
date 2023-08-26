import 'package:flutter/material.dart' show ValueNotifier;

class ListNotifier<T> extends ValueNotifier<List<T>> {
  ListNotifier(super.value);
}
