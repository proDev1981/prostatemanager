import 'package:flutter/material.dart';

class Number extends ValueNotifier{
  // contructor
  Number(super.value);
  // getter
  String get text => super.value.toString();
}