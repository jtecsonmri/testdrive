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
    mbcViewer: (BuildContext context) => const MbcViewerPage(),
    viewer: (BuildContext context) => const ViewerPage()
  };
  
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    late Route<dynamic> pageRoute;
    switch(routeSettings.name){
      case splash:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const SplashPage(),settings: routeSettings);
        break;
      case home:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const HomePage(title: 'Home'),settings: routeSettings);
        break;
      case login:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const LoginPage(),settings: routeSettings);
        break;
      case logout:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const LogoutPage(),settings: routeSettings);
        break;
      case register:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const RegisterPage(),settings: routeSettings);
        break;
      case '/':        
      case enterCode:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const EnterCodePage(),settings: routeSettings);
        break;
      case hcViewer:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const HcViewerPage(),settings: routeSettings);
        break;
      case clViewer:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const ClViewerPage(),settings: routeSettings);
        break;
      case pbcViewer:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const PbcViewerPage(),settings: routeSettings);
        break;
      case mdvViewer:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const MdvViewerPage(),settings: routeSettings);
        break;
      case mbcViewer:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const MbcViewerPage(),settings: routeSettings);
        break;                                        
      case viewer:
        pageRoute = MaterialPageRoute(builder: (BuildContext context) => const ViewerPage(),settings: routeSettings);
        break;                                                 
    }
    return pageRoute;
  }

  static Route<dynamic> _errorRoute() {
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