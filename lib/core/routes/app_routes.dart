import 'package:flutter/material.dart';
import 'package:url_app/features/screens/url_host_screen.dart';

import '../../features/screens/splash_screen.dart';

class Routes {
  static const String initialRoutes = '/';
  static const String urlHostScreen = '/urlHostScreen';

}

class AppRoutes {
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoutes:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.urlHostScreen:
        return MaterialPageRoute(builder: (_) =>  UrlHostScreen());


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Found Route")),
          ),
        );
    }
  }
}
