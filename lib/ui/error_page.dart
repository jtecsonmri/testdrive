import 'package:flutter/material.dart';

import '../models/route_args.dart';

class ErrorPage extends StatefulWidget {
  final RouteArgs? routeArgs;
  const ErrorPage({super.key, this.routeArgs});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  String? location = '';
  @override
  void initState() {
    super.initState();
    location = widget.routeArgs!.error;
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Text(location!),
        ),
      );
  }
}