import 'package:flutter/material.dart';
import 'package:testdrive/models/webview_args.dart';

import '../routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isStaySignedIn = false;
  @override
  Widget build(BuildContext context) {
    final code = ModalRoute.of(context)!.settings.arguments as String;
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
                    child: Image(
                        image: AssetImage(
                            'assets/images/HealthConnectedLogo.png')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all( const Color(0xFF2b2fda))
                    ),
                    onPressed: () {
                      webViewLoginByCode(code);
                    },  
                    child: const Text(
                      'Sign in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isStaySignedIn,
                    onChanged: (bool? val) {
                      setState(() {
                        isStaySignedIn = val!;
                      });
                    },
                  ),
                  const Text('Stay signed in'),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Divider(),
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.home);
                  },
                  child: const Text(
                    'Create an account',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text('Or, continue with'),
              ),     
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    webViewSsoLoginByCode(code);
                  },
                  child: const Text(
                    'Single Sign On',
                  ),
                ),
              ),                       
            ],
          ),
        ));
  }

  webViewLoginByCode(String code){
    var args = WebViewArgs();
    args.initialUrl = 'https://uat.mediresource.com/HC2020/ui/account/sign-in';
    if(code.isNotEmpty && code.length >= 2 ){
      String uniqueIdentifier = code.substring(0,2);
      switch(uniqueIdentifier){
        case '00':
          args.initialUrl = 'https://uat.mediresource.com/HC2020/ui/account/sign-in';
          Navigator.pushNamed(context, Routes.hcViewer, arguments: args);
          break;        
        case '01':
          args.initialUrl = 'https://canadalife.ihealthconnected.com/ui/account/sign-in';
          Navigator.pushNamed(context, Routes.clViewer, arguments: args);
          break;
        case '02':
          args.initialUrl = 'https://pacificbluecross.ihealthconnected.com/ui/account/sign-in';
          Navigator.pushNamed(context, Routes.pbcViewer, arguments: args);
          break;
        case '03':
          args.initialUrl = 'https://medaviebc.ihealthconnected.com/ui/account/sign-in';
          Navigator.pushNamed(context, Routes.mdvViewer, arguments: args);
          break;
        case '04':
          args.initialUrl = 'https://mbc.ihealthconnected.com/ui/account/sign-in';
          Navigator.pushNamed(context, Routes.mbcViewer, arguments: args);
          break;                              
      }
    }
  }

  webViewSsoLoginByCode(String code){
    var args = WebViewArgs();
    args.initialUrl = 'https://demo.perquisite.net/RewardCentre/M/Login#/';
    if(code.isNotEmpty && code.length >= 2 ){
      String uniqueIdentifier = code.substring(0,2);
      switch(uniqueIdentifier){
        case '00':  
          args.initialUrl = 'https://demo.perquisite.net/RewardCentre/M/Login#/';
          Navigator.pushNamed(context, Routes.hcViewer, arguments: args);
          break;        
        case '01':
          args.initialUrl = 'https://my.canadalife.com/sign-in';
          Navigator.pushNamed(context, Routes.clViewer, arguments: args);
          break;
        case '02':
          args.initialUrl = 'https://service.pac.bluecross.ca/member/login/';
          Navigator.pushNamed(context, Routes.pbcViewer, arguments: args);
          break;
        case '03':
          args.initialUrl = 'https://members.medaviebc.ca/en/login';
          Navigator.pushNamed(context, Routes.mdvViewer, arguments: args);
          break;
        case '04':
          args.initialUrl = 'https://member.mb.bluecross.ca';
          Navigator.pushNamed(context, Routes.mbcViewer, arguments: args);
          break;                              
      }
    }
  }
}
