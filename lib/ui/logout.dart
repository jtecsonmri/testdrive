import 'package:flutter/material.dart';

import '../models/route_args.dart';

class LogoutPage extends StatefulWidget {
  final RouteArgs? routeArgs;
  const LogoutPage({super.key, this.routeArgs});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}