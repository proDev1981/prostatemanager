
import 'package:flutter/material.dart';

class Textfull extends StatefulWidget{
  // properties
  final ValueNotifier value;
  final String? start;
  final String? end;
  // constructor
  const Textfull({
    this.start="",
    this.end="",
    super.key, 
    required this.value
  });

  @override
  State<Textfull> createState() => _RenderTextfullState();
}

class _RenderTextfullState extends State<Textfull> {
  @override
  void initState() {
    widget.value.addListener(() => setState(() {}));
    super.initState();
  }
  @override
  void dispose() {
    widget.value.removeListener(() { });
    super.dispose();
  }
  // builder
  @override
  Widget build(BuildContext context) {
    return Text('${widget.start}${widget.value.value.toString()}${widget.end}');
  }
}