import 'package:flutter/material.dart';
import 'package:pruebas/manager/core.dart';

import '../store_manager/store_widget.dart';

class DesktopApp {
  // properties
  final Widget app;
  final List? stores;
  // constructor
  DesktopApp({required this.app, this.stores}) {
    runApp(StoreWidget(
        stores: stores,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: app),
        )));
  }
}

