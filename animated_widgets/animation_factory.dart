// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

typedef BuilderWithController = Widget Function(BuildContext,AnimationController);

class AnimationFactory extends StatefulWidget{

  final BuilderWithController builder;
  final Duration duration;
  void Function(AnimationController)? getController;

  // ignore: prefer_const_constructors_in_immutables
  AnimationFactory(this.builder,{ 
    this.duration = const Duration(milliseconds:300),
    this.getController,
    super.key 
  });

  @override
  State<AnimationFactory> createState() => _AnimationFactoryState();
}

class _AnimationFactoryState extends State<AnimationFactory> with TickerProviderStateMixin {

  late final AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync:this
      );
    if(widget.getController != null) widget.getController!(controller);
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: controller,
      builder:(context,_) => widget.builder(context, controller)
      );
  }
}
