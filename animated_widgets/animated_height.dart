import 'package:flutter/material.dart';

import 'animation_factory.dart';


// ignore: must_be_immutable
class AnimatedHeight extends AnimationFactory{

  final Offset height;
  final double width;
  final Widget child;

  AnimatedHeight({
    required this.child,
    this.height=const Offset(30,30),
    this.width=100,
    super.key,
    super.duration,
    super.getController,

  }): super((context,controller){

    Animation animatedHeight = Tween(begin:height.dx,end:height.dy).animate(controller);

    return SizedBox(
      height: animatedHeight.value,
      child:child,
    );
  });
}
