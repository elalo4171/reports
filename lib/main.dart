import 'package:flutter/material.dart';
import 'package:reports/app/data/provider/reports_local_db.dart';
import 'package:reports/config/routes.dart';
import 'package:reports/config/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ReportsLocalDb.initDataBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reports App',
      theme: ThemeApp.themeLigth,
      onGenerateRoute: routes,
      initialRoute: 'welcome',
      debugShowCheckedModeBanner: false,
    );
  }
}
