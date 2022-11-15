import 'package:flutter/material.dart';
import 'package:reports/app/data/bloc/global_bloc.dart';
import 'package:reports/app/pages/home_page.dart';
import 'package:reports/app/pages/new_report.dart';
import 'package:reports/app/pages/welcome_page.dart';
import '../app/SplashPage.dart';

Route Function(RouteSettings) get routes => (RouteSettings settings) {
      Route route;

      switch (settings.name) {
        case "welcome":
          route = MaterialPageRoute(
            builder: (_) => const WelcomePage(),
            settings: RouteSettings(name: settings.name),
          );
          break;
        case "home":
          route = MaterialPageRoute(
            builder: (_) => const HomePage(),
            settings: RouteSettings(name: settings.name),
          );
          break;
        case "new_report":
          route = MaterialPageRoute(
            builder: (_) =>
                NewReport(globalBloc: settings.arguments as GlobalBloc),
            settings: RouteSettings(name: settings.name),
          );
          break;

        default:
          route = MaterialPageRoute(
            builder: (_) => const SplashPage(),
            settings: RouteSettings(name: settings.name),
          );
          break;
      }

      return route;
    };
