import 'package:customer_listing_app/AddCustomerScreen.dart';
import 'package:customer_listing_app/Authentication/AuthScreen.dart';
import 'package:customer_listing_app/HomeScreen.dart';
import 'package:customer_listing_app/NotificationsScreen.dart';
import 'package:customer_listing_app/SplashScreen.dart';
import 'package:flutter/material.dart';

class ScreenRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case 'AuthScreen':
        return MaterialPageRoute(builder: (_) => AuthScreen());

      case 'HomeScreen':
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case 'NotificationScreen':
        return MaterialPageRoute(builder: (_) => NotificationScreen());

      case 'AddCustomerScreen':
        return MaterialPageRoute(builder: (_) => AddCustomerScreen());

      default:
        return MaterialPageRoute(builder: (_) => AuthScreen());
    }
  }
}