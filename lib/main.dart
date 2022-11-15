import 'package:flutter/material.dart';
import 'package:reports/config/routes.dart';
import 'package:reports/config/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeApp.themeLigth,
      onGenerateRoute: routes,
      initialRoute: 'welcome',
    );
  }
}
