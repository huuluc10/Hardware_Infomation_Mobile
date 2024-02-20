import 'package:flutter/material.dart';

import 'hardware_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CPU-Z',
      // home: Scaffold(body: CPUZ()),
      home: CPUZ(),
    );
  }
}
