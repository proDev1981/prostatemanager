import 'package:flutter/material.dart';

class CounterController extends ValueNotifier<int>{
  // constructor
  CounterController(super.value);
  // methods
  void increment() => super.value++;
  void decrement() => super.value--;
  void incrementTo(int number) => super.value += number;
  void decrementTo(int number) => super.value -= number; 
  String get text => super.value.toString();
}