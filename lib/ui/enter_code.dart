import 'package:flutter/material.dart';
import 'package:testdrive/routes.dart';

class EnterCodePage extends StatefulWidget {
  const EnterCodePage({super.key});

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
                  Navigator.pushNamed(context, Routes.login, arguments: enterCodeFieldController.text);
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
}