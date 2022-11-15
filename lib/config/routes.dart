import 'package:flutter/material.dart';
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

        default:
          route = MaterialPageRoute(
            builder: (_) => const SplashPage(),
            settings: RouteSettings(name: settings.name),
          );
          break;
      }

      return route;
    };
