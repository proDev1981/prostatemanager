// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../store_manager/refresh.dart';

class Label extends StatelessWidget {
  Label(this.data, {super.key, this.style}) {
    assert(data is Listenable || data is String);

    if (data is ValueNotifier) {
      dep = data;

      _child = Refresh(
          [dep!],
          (context) => Text(dep!.value.toString(),
              style: TextStyle(
                color: style?.color,
                fontSize: style?.fontSize,
                fontFamily: style?.fontFamily,
                shadows: style?.shadows,
                decoration: style?.decoration,
              )));
    }
    if (data is String) {
      value = data;

      _child = Text(value!,
          style: TextStyle(
            color: style?.color,
            fontSize: style?.fontSize,
            fontFamily: style?.fontFamily,
            shadows: style?.shadows,
            decoration: style?.decoration,
          ));
    }
  }

  final dynamic data;
  String? value;
  ValueNotifier? dep;
  TextStyleEdited? style;
  Widget? _child;

  @override
  Widget build(BuildContext context) {
    return _child!;
  }
}

class TextStyleEdited with ChangeNotifier {
  Color? color;
  String? fontFamily;
  double? fontSize;
  TextDecoration? decoration;
  List<Shadow>? shadows;

  setColor(Color c) {
    color = c;
    notifyListeners();
  }

  setFontSize(double s) {
    fontSize = s;
    notifyListeners();
  }

  setFontFamily(String s) {
    fontFamily = s;
    notifyListeners();
  }

  setDecoration(TextDecoration d) {
    decoration = d;
    notifyListeners();
  }

  setShadows(List<Shadow> s) {
    shadows = s;
    notifyListeners();
  }
}
