import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/webview_args.dart';

class WebViewerPage extends StatefulWidget {
  const WebViewerPage({super.key});

  @override
  State<WebViewerPage> createState() => _WebViewerPageState();
}

class _WebViewerPageState extends State<WebViewerPage> {
  late final WebViewArgs args;
  late final WebViewController controller;
  static const userAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36';
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setUserAgent(userAgent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          debugPrint('WebViewController - onPageStarted: $url');         
          // setState(() {
          //   loadingPercentage = 0;
          // });
        },
        onProgress: (progress) {
          debugPrint('WebViewController - onProgress: $progress');         
          // setState(() {
          //   loadingPercentage = progress;
          // });
        },
        onPageFinished: (url) {
          debugPrint('WebViewController - onPageFinished: $url');
          // setState(() {
          //   loadingPercentage = 100;
          // });
          if(url.contains(args.defaultUrl!)){
            controller.loadRequest(Uri.parse(args.targetUrl!));
          }
        },
        onUrlChange: (change) {
          debugPrint('WebViewController - onUrlChange: ${change.url}');     
        },
        onWebResourceError: (error) {
          debugPrint('WebViewController - onWebResourceError: ${error.description}');            
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as WebViewArgs;
    controller.loadRequest(Uri.parse(args.initialUrl!));
    return SafeArea(
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}