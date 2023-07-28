import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testdrive/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/route_args.dart';
import '../models/webview_args.dart';

class HcAuthCallbackPage extends StatefulWidget {
  final RouteArgs? routeArgs;
  const HcAuthCallbackPage({super.key, this.routeArgs});

  @override
  State<HcAuthCallbackPage> createState() => _HcAuthCallbackPageState();
}

class _HcAuthCallbackPageState extends State<HcAuthCallbackPage> {
  late final WebViewController controller;
  static const userAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36';
  var loadingPercentage = 0;
  bool isInit = false;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setUserAgent(userAgent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          debugPrint('WebViewController - onPageStarted: $url');      
          if(!isInit){
            final items = _getFragmentParams();
            if(items.containsKey('id_token')) {
              controller.runJavaScript("window.localStorage.setItem('id_token','${items['id_token'] ?? ''}')");
            }
            if(items.containsKey('access_token')) {
              controller.runJavaScript("window.localStorage.setItem('access_token','${items['access_token'] ?? ''}')");
            }            
            isInit = true;
          }
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
    controller.loadRequest(Uri.parse('https://uat.mediresource.com/HC2020/ui/main/dashboard'));
    return SafeArea(
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }

  Map<String,String> _getFragmentParams(){
    Map<String,String> result = {};
    if(widget.routeArgs != null){
      String fragment = widget.routeArgs!.uri.fragment;
      for (final item in fragment.split('&')) {
          final keyVal = item.split('=');
          String key = keyVal[0];
          String val = '';
          if(keyVal.length > 1){
            val = Uri.decodeComponent(keyVal[1]);
          }
          result.putIfAbsent(key,() => val);
      }
    }
    return result;
  }
}