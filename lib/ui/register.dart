import 'package:flutter/material.dart';

import '../models/route_args.dart';

class RegisterPage extends StatefulWidget {
  final RouteArgs? routeArgs;
  const RegisterPage({super.key, this.routeArgs});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}