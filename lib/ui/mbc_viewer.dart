import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/web_view_args.dart';

class MbcViewerPage extends StatefulWidget {
  const MbcViewerPage({super.key});

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
    final args = ModalRoute.of(context)!.settings.arguments as WebViewArgs;
    controller.loadRequest(Uri.parse(args.initialUrl!));
    return SafeArea(
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}