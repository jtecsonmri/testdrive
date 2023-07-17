import 'package:flutter/material.dart';
import 'ui/hc_viewer.dart';
import 'ui/home.dart';
import 'ui/mbc_viewer.dart';
import 'ui/mdv_viewer.dart';
import 'ui/register.dart';
import 'ui/viewer.dart';
import 'ui/cl_viewer.dart';
import 'ui/login.dart';
import 'ui/logout.dart';
import 'ui/pbc_viewer.dart';
import 'ui/splash.dart';
import 'ui/enter_code.dart';

class Routes {
  Routes._();
  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String register = '/register';
  static const String enterCode = '/enter_code';
  static const String hcViewer = '/hc_viewer';
  static const String clViewer = '/cl_viewer';
  static const String pbcViewer = '/pbc_viewer';
  static const String mdvViewer = '/mdv_viewer';
  static const String mbcViewer = '/mbc_viewer';
  static const String viewer = '/viewer';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => const SplashPage(),
    home: (BuildContext context) => const HomePage(title: 'Home',),
    login: (BuildContext context) => const LoginPage(),
    logout: (BuildContext context) => const LogoutPage(),
    register: (BuildContext context) => const RegisterPage(),
    enterCode: (BuildContext context) => const EnterCodePage(),
    hcViewer: (BuildContext context) => const HcViewerPage(),
    clViewer: (BuildContext context) => const ClViewerPage(),
    pbcViewer: (BuildContext context) => const PbcViewerPage(),
    mdvViewer: (BuildContext context) => const MdvViewerPage(),
    mbcViewer: (BuildContext context) => const MbcViewerPage(),
    viewer: (BuildContext context) => const ViewerPage()
  };
  
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    var builder = routes[home];
    if(routes.containsKey(routeSettings.name)){
      builder = routes[routeSettings.name];
    } else if('/' == routeSettings.name){
      builder = routes[enterCode];
    }
    return MaterialPageRoute(builder: builder!, settings: routeSettings);
  }

  static Route<dynamic> getErrorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Error"),
        ),
      );
    });
  }
}