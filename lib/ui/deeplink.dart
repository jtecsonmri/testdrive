import 'package:flutter/material.dart';

import '../models/route_args.dart';

class DeepLinkPage extends StatefulWidget {
  final RouteArgs? routeArgs;
  const DeepLinkPage({super.key, this.routeArgs});

  @override
  State<DeepLinkPage> createState() => _DeepLinkPageState();
}

class _DeepLinkPageState extends State<DeepLinkPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('DeepLink'),
      ),
    );
  }
}