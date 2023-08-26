
import 'package:flutter/material.dart' show ValueNotifier;

bool isList<T>(data){
  return (data is List<T>);
}
bool isListNotifier<T>(data){
  return (data is ValueNotifier<List<T>>);
}
