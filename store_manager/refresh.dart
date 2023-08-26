// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../widgets/rx.dart';

class Refresh extends RX {
  Refresh(dependecies, this.builder, {super.key})
      : super(dependencies: dependecies);

  final Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

/*
class Refresh extends StatefulWidget{
  const Refresh(
    this.dependecies,
    this.builder,
  {
    super.key
  });

  final List<Listenable> dependecies;
  final Function(BuildContext context) builder;

  @override
  State<Refresh> createState() => _RefreshState();
}

class _RefreshState extends State<Refresh> {

  @override
  void initState(){
    for(final item in widget.dependecies){
      item.addListener(() => setState((){}));
    }
    super.initState();
  }

  @override
  void dispose(){
    for(final item in widget.dependecies){
      item.removeListener((){});
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
*/
