import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:testdrive/routes.dart';

import '../models/route_args.dart';
import '../models/webview_args.dart';

class EnterCodePage extends StatefulWidget {
  final RouteArgs? routeArgs;
  const EnterCodePage({super.key, this.routeArgs});

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  final enterCodeFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 250,
                    height: 100,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image(image: AssetImage('assets/images/HealthConnectedLogo.png')),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: enterCodeFieldController,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Code',
                  hintText: 'Enter code from your provider  '
                ),
              ),
            ),  
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, Routes.login, arguments: enterCodeFieldController.text);
                  launchWebViewByCode(enterCodeFieldController.text);
                },
                child: const Text(
                  'Submit',
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  launchWebViewByCode(String code){
    WebViewArgs args = WebViewArgs();
    switch(code.toUpperCase()){
      case '9FB0C363':
          args.initialUrl = 'https://uat.mediresource.com/HC2020/ui/account/sign-in';
          //Navigator.pushNamed(context, Routes.hcViewer, arguments: args);
        break;
      case 'B224CAEB':
          args.initialUrl = 'https://canadalife.ihealthconnected.com/ui/account/sign-in';
          //Navigator.pushNamed(context, Routes.clViewer, arguments: args);
        break;
      case 'F515DF5C':
          args.initialUrl = 'https://pacificbluecross.ihealthconnected.com/ui/account/sign-in';
          //Navigator.pushNamed(context, Routes.pbcViewer, arguments: args);
        break;
      case '7781095C':
          args.initialUrl = 'https://medaviebc.ihealthconnected.com/ui/account/sign-in';
          //Navigator.pushNamed(context, Routes.mdvViewer, arguments: args);
        break;
      case '625A266D':
          args.initialUrl = 'https://mbc.ihealthconnected.com/ui/account/sign-in';
          //Navigator.pushNamed(context, Routes.mbcViewer, arguments: args);
        break;    
      case '676679F0':
          args.initialUrl = 'https://demo.perquisite.net/RewardCentre/M/Login#/';
          args.defaultUrl = 'https://demo.perquisite.net/RewardCentre/M/RC#/Home';
          args.targetUrl = 'https://demo.perquisite.net/RewardCentre/IdentityProvider/saml2?lid=549203ee-75d6-47e9-abee-fc33d20c9de1';
          //Navigator.pushNamed(context, Routes.hcViewer, arguments: args);
        break;      
      case 'F8260BA9':
          args.initialUrl = 'https://my.canadalife.com/sign-in';
          args.defaultUrl = 'https://my.canadalife.com/s/dashboard';
          args.targetUrl = 'https://my.canadalife.com/Wellness_HealthConnected';      
        break;                                       
    }
    bool isValid = args.initialUrl?.isNotEmpty ?? false;
    if(isValid){
      context.push(Routes.webViewer, extra: args);
    } else {
          const snackBar = SnackBar(
            content: Text('Invalid code'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);      
    }
  }
}