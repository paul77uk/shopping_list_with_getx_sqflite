import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/shopping_list_screen.dart';

void main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoppping List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ShList());
  }
}
