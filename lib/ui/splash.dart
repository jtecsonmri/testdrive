import 'package:flutter/material.dart';
import 'package:testdrive/models/route_args.dart';

class SplashPage extends StatefulWidget {
  final RouteArgs? routeArgs;
  const SplashPage({super.key, this.routeArgs});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}