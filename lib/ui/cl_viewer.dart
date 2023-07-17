import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/web_view_args.dart';

class ClViewerPage extends StatefulWidget {
  const ClViewerPage({super.key});

  @override
  State<ClViewerPage> createState() => _ClViewerPageState();
}

class _ClViewerPageState extends State<ClViewerPage> {
  var loadingPercentage = 0;
  late final WebViewController controller;
  String targetUrl = 'https://my.canadalife.com/s/dashboard';
  String redirectUrl = 'https://my.canadalife.com/Wellness_HealthConnected';
  @override
  void initState() {
    super.initState();
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
          if(url.contains(targetUrl)){
            controller.loadRequest(Uri.parse(redirectUrl));
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
    final args = ModalRoute.of(context)!.settings.arguments as WebViewArgs;
    controller.loadRequest(Uri.parse(args.initialUrl!));
    return SafeArea(
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}