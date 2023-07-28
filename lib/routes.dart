import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testdrive/ui/deeplink.dart';
import 'package:testdrive/ui/error_page.dart';
import 'package:testdrive/ui/hc_auth_callback.dart';
import 'package:testdrive/ui/notification_viewer.dart';
import 'models/route_args.dart';
import 'ui/hc_viewer.dart';
import 'ui/home.dart';
import 'ui/mbc_viewer.dart';
import 'ui/mdv_viewer.dart';
import 'ui/notify.dart';
import 'ui/register.dart';
import 'ui/viewer.dart';
import 'ui/cl_viewer.dart';
import 'ui/login.dart';
import 'ui/logout.dart';
import 'ui/pbc_viewer.dart';
import 'ui/splash.dart';
import 'ui/enter_code.dart';
import 'ui/web_viewer.dart';

class Routes {
  Routes._();
  static const String splash = '/splash';
  static const String deeplink = '/deeplink';
  static const String home = '/home';
  static const String login = '/login';
  static const String logout = '/logout';
  static const String register = '/register';
  static const String enterCode = '/enter_code';
  static const String notify = '/notify';
  static const String notificationViewer = '/notification_viewer';
  static const String webViewer = '/web_viewer';
  static const String hcViewer = '/hc_viewer';
  static const String clViewer = '/cl_viewer';
  static const String pbcViewer = '/pbc_viewer';
  static const String mdvViewer = '/mdv_viewer';
  static const String mbcViewer = '/mbc_viewer';
  static const String viewer = '/viewer';

  static const String hcCallback = '/HC2020/ui/auth-callback';

  static GoRouter getRoutes = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const EnterCodePage();
        },
      ),
      GoRoute(
        path: home,
        builder: (context, state) {
          return HomePage(title: 'Home', routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: splash,
        builder: (context, state) {
          return SplashPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: deeplink,
        builder: (context, state) {
          return DeepLinkPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: login,
        builder: (context, state) {
          return LoginPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: logout,
        builder: (context, state) {
          return LogoutPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: register,
        builder: (context, state) {
          return RegisterPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: enterCode,
        builder: (context, state) {
          return EnterCodePage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: notify,
        builder: (context, state) {
          return NotifyPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: notificationViewer,
        builder: (context, state) {
          return NotificationViewerPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: hcViewer,
        builder: (context, state) {
          return HcViewerPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: clViewer,
        builder: (context, state) {
          return ClViewerPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: pbcViewer,
        builder: (context, state) {
          return PbcViewerPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: mdvViewer,
        builder: (context, state) {
          return MdvViewerPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: mbcViewer,
        builder: (context, state) {
          return MbcViewerPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: webViewer,
        builder: (context, state) {
          return WebViewerPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: viewer,
        builder: (context, state) {
          return ViewerPage(routeArgs: _getRouteArgs(state));
        },
      ),
      GoRoute(
        path: hcCallback,
        builder: (context, state) {
          return HcAuthCallbackPage(routeArgs: _getRouteArgs(state));
        },
      ),                                                
    ],
    errorBuilder: (context, state) {
      return ErrorPage(routeArgs: _getRouteArgs(state));
    },
  );

  static RouteArgs _getRouteArgs(GoRouterState state){
    return RouteArgs(
      state.uri, 
      state.matchedLocation, 
      state.name, 
      state.path, 
      state.fullPath, 
      state.pathParameters, 
      state.extra, 
      state.pageKey,
      state.error?.message);
  }
}