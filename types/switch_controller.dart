import 'package:flutter/material.dart';

class SwitchController extends ValueNotifier<bool>{
  // contructor
  SwitchController() : super(false);
  // methods
  void change(){
    super.value = !super.value;
  }
  // getter
  bool get state => super.value;
  String get text => super.value.toString();
  // setter
  set state(bool value) => super.value = value;
}