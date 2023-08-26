import 'package:flutter/material.dart';

import '../types/counter_controller.dart';

class Counterfull extends StatefulWidget{
  // properties
  final CounterController controller;
  final double? height;
  final double? width;
  // constructor
  const Counterfull({
    this.height = 40,
    this.width = 70,
    super.key, 
    required this.controller
    });

  @override
  State<Counterfull> createState() => _CounterfullState();
}

class _CounterfullState extends State<Counterfull> {
  @override
  void initState() {
    widget.controller.addListener(() => setState((){}));
    super.initState();
  }
  @override
  void dispose() {
    widget.controller.removeListener(() { });
    super.dispose();
  }
  // builder
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      width: widget.width,
      height: widget.height,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            height: widget.height,
            width: widget.width! - 30,
            decoration: BoxDecoration(
              border: Border.all(color:Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(5)), 
            ),
            child: Text(widget.controller.text)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  widget.controller.increment();
                },
                child: SizedBox(
                  height: (widget.height!) /3,
                  child: const Icon(Icons.arrow_drop_up),
                )
              ),
              SizedBox(height: widget.height!/10),
              GestureDetector(
                onTap: (){
                  widget.controller.decrement();
                },
                child: SizedBox(
                  height: (widget.height!) /3,
                  child: const Icon(Icons.arrow_drop_down)
                )
              ),
    
            ])
        ]),
    );
  }
}