import 'package:flutter/material.dart';

class App{
  static final navigatorKey = GlobalKey<NavigatorState>();
  static Future<dynamic> navigateTo(String routeName, Object? args){
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }
}