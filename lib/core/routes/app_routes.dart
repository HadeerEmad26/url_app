import 'package:flutter/material.dart';
import 'package:url_app/features/presentation/screens/login.dart';

import '../../features/presentation/screens/splash_screen.dart';
import '../../features/presentation/screens/url_host_screen.dart';

class Routes {
  static const String initialRoutes = '/';
  static const String urlHostScreen = '/urlHostScreen';
  static const String loginScreen = '/loginScreen';

}

class AppRoutes {
  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoutes:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.urlHostScreen:
        return MaterialPageRoute(builder: (_) =>  WebViewScreen());

        case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) =>  Login());


      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Found Route")),
          ),
        );
    }
  }
}
