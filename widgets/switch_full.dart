
import 'package:flutter/material.dart';

import '../types/switch_controller.dart';

class Switchfull extends StatefulWidget{
  // properties
  final SwitchController controller;
  final Widget? label;
  // constructor
  const Switchfull({
    super.key, 
    this.label,
    required this.controller
    });

  @override
  State<Switchfull> createState() => _SwitchfullState();
}

class _SwitchfullState extends State<Switchfull> {
  @override
  void initState() {
    widget.controller.addListener(() => setState(() {}));
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
    return Row(
      children: [
        if(widget.label != null) widget.label!,
        Switch(
          value: widget.controller.state, 
          onChanged: (bool state){
            widget.controller.state = state;
          } ,
        ),
      ],
    );
  }
}