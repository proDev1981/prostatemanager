import 'package:flutter/material.dart';

import 'animation_factory.dart';

class AnimatedWidth extends AnimationFactory{

  final Widget child ;
  final Offset width;
  final double height;
  AnimationController? controller;

  AnimatedWidth({
    required this.child, 
    this.width= const Offset(0,0), 
    this.height=30, 
    super.duration,
    super.getController,
    super.key,
    }) : 
    super((context,controller){
      Animation animatedWidth = Tween<double>( begin:width.dx, end:width.dy ).animate(controller);

      return SizedBox(
        width:animatedWidth.value,
        height:height,
        child:child
        );
    });
}
