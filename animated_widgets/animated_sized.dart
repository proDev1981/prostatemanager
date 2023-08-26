import 'package:flutter/material.dart';

import 'animation_factory.dart';


// ignore: must_be_immutable
class AnimatedSized extends AnimationFactory{

  final Offset height;
  final Offset width;
  final Widget child;

  AnimatedSized({

    required this.child,
    this.height=const Offset(30,30),
    this.width=const Offset(100,100),
    super.key,
    super.duration,
    super.getController,

  }): super((context,controller){

    Animation animatedHeight = Tween(begin:height.dx,end:height.dy).animate(controller);
    Animation animatedWidth = Tween(begin:width.dx,end:width.dy).animate(controller);

    return SizedBox(
      height: animatedHeight.value,
      width: animatedWidth.value,
      child:child,
    );
  });
}
