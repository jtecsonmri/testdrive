import 'dart:io';

import 'package:flutter/material.dart';
import 'package:testdrive/models/webview_args.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class ViewerPage extends StatefulWidget {
  const ViewerPage({super.key});

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  var loadingPercentage = 0;
  late final PlatformWebViewController  controller;
  late final WebViewArgs args;
  @override
  void initState() {
    super.initState();
    controller = PlatformWebViewController(getPlatformWebViewControllerCreationParams())
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setPlatformNavigationDelegate(PlatformNavigationDelegate(
        const PlatformNavigationDelegateCreationParams())
        ..setOnPageStarted((url) {
          debugPrint('PlatformWebViewController: Page started loading: $url');
        })
        ..setOnPageFinished((url) {
          debugPrint('PlatformWebViewController: Page finished loading: $url');
          if(url.contains(args.defaultUrl!)){
            controller.loadRequest(LoadRequestParams(uri: Uri.parse(args.targetUrl!)));
          }
        })
        ..setOnProgress((int progress) {
          debugPrint('WebView is loading (progress : $progress%)');
        })
        ..setOnWebResourceError((error) {
            debugPrint(''' PlatformWebViewController:
              Page resource error:
              code: ${error.errorCode}
              description: ${error.description}
              errorType: ${error.errorType}
              isForMainFrame: ${error.isForMainFrame}
              url: ${error.url}
                      ''');          
        })
        ..setOnNavigationRequest((NavigationRequest request) {
            // if (request.url.startsWith('https://www.example.com/')) {
            //   debugPrint('blocking navigation to ${request.url}');
            //   return NavigationDecision.prevent;
            // }
            debugPrint('PlatformWebViewController: allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
        })
        ..setOnUrlChange((change) {
          debugPrint('PlatformWebViewController: url change to ${change.url}');
        })
      )
      ..addJavaScriptChannel(JavaScriptChannelParams(
        name: 'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      ))
      ..setOnPlatformPermissionRequest(
        (PlatformWebViewPermissionRequest request) {
          debugPrint(
            'requesting permissions for ${request.types.map((WebViewPermissionResourceType type) => type.name)}',
          );
          request.grant();
        },
      );
  }
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as WebViewArgs;
    controller.loadRequest(LoadRequestParams(uri: Uri.parse(args.initialUrl!)));
    return SafeArea(
      child: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: controller)
      ).build(context),
    );
  }
  
  PlatformWebViewControllerCreationParams getPlatformWebViewControllerCreationParams(){
    if (Platform.isAndroid) {
      return AndroidWebViewControllerCreationParams();
    } else if (Platform.isIOS) {
      return WebKitWebViewControllerCreationParams(allowsInlineMediaPlayback: true);
    }
    return AndroidWebViewControllerCreationParams();
  }
}