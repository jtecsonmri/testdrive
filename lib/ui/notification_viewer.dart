import 'package:flutter/material.dart';

class NotificationViewerPage extends StatefulWidget {
  const NotificationViewerPage({super.key});

  @override
  State<NotificationViewerPage> createState() => _NotificationViewerPageState();
}

class _NotificationViewerPageState extends State<NotificationViewerPage> {
  String? payload = '';
  @override
  Widget build(BuildContext context) {
    setState(() {
      payload = ModalRoute.of(context)!.settings.arguments as String?;  
    });
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
                    child: Image(image: AssetImage('assets/images/HealthConnectedLogo.png')),
                  ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Payload'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(payload ?? ''),
            )              
          ],
        ),
      )
    );
  }
}