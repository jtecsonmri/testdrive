import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/route_args.dart';
import '../models/webview_args.dart';

class MbcViewerPage extends StatefulWidget {
  final RouteArgs? routeArgs;
  const MbcViewerPage({super.key, this.routeArgs});

  @override
  State<MbcViewerPage> createState() => _MbcViewerPageState();
}

class _MbcViewerPageState extends State<MbcViewerPage> {
 var loadingPercentage = 0;
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          // setState(() {
          //   loadingPercentage = 0;
          // });
        },
        onProgress: (progress) {
          // setState(() {
          //   loadingPercentage = progress;
          // });
        },
        onPageFinished: (url) {
          // setState(() {
          //   loadingPercentage = 100;
          // });
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }
  @override
  Widget build(BuildContext context) {
    final args = widget.routeArgs!.extra as WebViewArgs;
    controller.loadRequest(Uri.parse(args.initialUrl!));
    return SafeArea(
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}