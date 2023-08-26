// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

abstract class RX extends StatefulWidget {
  RX({this.dependencies, super.key});
  // properties
  late Function(void Function()) setState;
  List<Listenable>? dependencies;
  String? _debuggerMsg;
  // methods
  Widget build(BuildContext context);
  void initState() {}
  void dispose() {}
  void addDepencies(Listenable dep) {
    // force subscrition
    dep.addListener(() => setState(() {}));
    if (dependencies != null) dependencies!.add(dep);
    dependencies ??= <Listenable>[dep];
  }

  T use<T>(T? dep, [bool record = true]) {
    if (dep != null && dep is Listenable) {
      if (record) {
        addDepencies(dep);
      }
      return dep;
    }
    throw "$T not found in Single Store !!";
  }

  //TODO: refactorizar para que funciones dentro del metodos build
  void useState<T>(T value) {
    final dep = ValueNotifier<T>(value);
    addDepencies(dep);
  }

  void useDebugger(String msg) {
    _debuggerMsg = msg;
  }

  ValueNotifier<T>? getState<T>() {
    if (dependencies != null) {
      for (final item in dependencies!) {
        if (item is ValueNotifier<T>) return item;
      }
    }
    return null;
  }

  @override
  State<RX> createState() => _RXState();
}

class _RXState extends State<RX> {
  @override
  void initState() {
    widget.initState();
    if (widget.dependencies != null) {
      for (final dep in widget.dependencies!) {
        dep.addListener(() => setState(() {}));
      }
    }
    widget.setState = setState;
    super.initState();
  }

  @override
  void dispose() {
    widget.dispose();
    if (widget.dependencies != null) {
      for (final dep in widget.dependencies!) {
        dep.removeListener(() {});
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._debuggerMsg != null) print(widget._debuggerMsg);
    return widget.build(context);
  }
}
