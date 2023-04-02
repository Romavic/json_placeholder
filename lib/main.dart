import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_placeholder/app/di/main_module.dart';

void main() {
  runApp(
    ModularApp(
      module: MainModule(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
