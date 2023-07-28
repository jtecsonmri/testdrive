import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/route_args.dart';
import '../models/webview_args.dart';

class ClViewerPage extends StatefulWidget {
  final RouteArgs? routeArgs;
  const ClViewerPage({super.key, this.routeArgs});

  @override
  State<ClViewerPage> createState() => _ClViewerPageState();
}

class _ClViewerPageState extends State<ClViewerPage> {
  late final WebViewArgs args;
  var loadingPercentage = 0;
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    args = widget.routeArgs!.extra as WebViewArgs;
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          if (kDebugMode) {
            print('WebViewController - onPageStarted: $url');
          }          
          // setState(() {
          //   loadingPercentage = 0;
          // });
        },
        onProgress: (progress) {
          if (kDebugMode) {
            print('WebViewController - onProgress: $progress');
          }          
          // setState(() {
          //   loadingPercentage = progress;
          // });
        },
        onPageFinished: (url) {
          if (kDebugMode) {
            print('WebViewController - onPageFinished: $url');
          }
          // setState(() {
          //   loadingPercentage = 100;
          // });
          if(url.contains(args.defaultUrl!)){
            controller.loadRequest(Uri.parse(args.targetUrl!));
          }
        },
        onUrlChange: (change) {
          if (kDebugMode) {
            print('WebViewController - onUrlChange: ${change.url}');
          }          
          
        },
        onWebResourceError: (error) {
          if (kDebugMode) {
            print('WebViewController - onWebResourceError: ${error.description}');
          }            
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }
  @override
  Widget build(BuildContext context) {
    controller.loadRequest(Uri.parse(args.initialUrl!));
    return SafeArea(
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}