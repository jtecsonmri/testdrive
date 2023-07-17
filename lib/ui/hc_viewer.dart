import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testdrive/models/web_view_args.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HcViewerPage extends StatefulWidget {
  const HcViewerPage({super.key});

  @override
  State<HcViewerPage> createState() => _HcViewerPageState();
}

class _HcViewerPageState extends State<HcViewerPage> {
  String ssoLoginUrl = 'https://demo.perquisite.net/RewardCentre/M/Login#/';
  String loginUrl = 'https://uat.mediresource.com/HC2020/ui/account/sign-in';
  String defaultUrl = 'https://demo.perquisite.net/RewardCentre/M/RC#/Home'; //Default url after successful sso login
  String targetUrl = 'https://demo.perquisite.net/RewardCentre/IdentityProvider/saml2?lid=549203ee-75d6-47e9-abee-fc33d20c9de1'; //Url to access HC
  var loadingPercentage = 0;
  late final WebViewController controller;
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
          if(url.contains(defaultUrl)){
            controller.loadRequest(Uri.parse(targetUrl));
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