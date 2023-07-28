import 'package:flutter/material.dart';
import 'package:testdrive/services/notification_service.dart';

import '../models/route_args.dart';

class NotifyPage extends StatefulWidget {
  final RouteArgs? routeArgs;
  const NotifyPage({super.key, this.routeArgs});

  @override
  State<NotifyPage> createState() => _NotifyPageState();
}

class _NotifyPageState extends State<NotifyPage> {
  NotificationService notificationService = NotificationService();
  final titleFieldController = TextEditingController(text: 'Health Connected Notification Service');
  final bodyFieldController = TextEditingController(text: 'Your Health & Wellness Companion');
  final payloadFieldController = TextEditingController(text: 'MRIHC');
  @override
  void initState() {
    super.initState();
    notificationService.init();
  }
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
                  controller: titleFieldController,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Title',
                  hintText: 'Enter title for notification'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: bodyFieldController,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Body',
                  hintText: 'Enter body for notification'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: payloadFieldController,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Payload',
                  hintText: 'Enter payload for notification'
                ),
              ),
            ),                           
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: OutlinedButton.icon(
                    onPressed: () {
                        notificationService.show(
                          title: titleFieldController.text, 
                          body: bodyFieldController.text,
                          payload: payloadFieldController.text
                        );
                    },
                    icon: const Icon(Icons.notification_add, size: 18),
                    label: const Text("Simple Notification"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: OutlinedButton.icon(
                    onPressed: () {
                        notificationService.schedule(  
                          title: 'Scheduled Notification',
                          body: '5 seconds after clicked',
                          payload: 'data',
                          scheduleDate: DateTime.now().add(const Duration(seconds: 5))
                        );
                        const snackBar = SnackBar(content: Text('Scheduled in 5 seconds'));
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(snackBar);
                    },
                    icon: const Icon(Icons.notifications_active, size: 18),
                    label: const Text("Schedule Notification"),
                  ),
                ),
              ),
            ),                      
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: OutlinedButton.icon(
                    onPressed: () {
                        notificationService.cancelAll();
                    },
                    icon: const Icon(Icons.notifications_off, size: 18),
                    label: const Text("Remove Notification"),
                  ),
                ),
              ),
            ),                        
          ],
        ),
      )
    );
  }
}