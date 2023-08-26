import 'package:flutter/material.dart';
import 'animation_factory.dart';

// ignore: must_be_immutable
class Hover extends StatelessWidget {
  final AnimationFactory child;
  AnimationController? _controller;

  Hover({required this.child, super.key}) {
       child.getController = (controller) => _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (e) => {if (_controller != null) _controller!.forward()},
        onExit: (e) => {if (_controller != null) _controller!.reverse()},
        child: child);
  }
}
