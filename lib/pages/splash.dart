import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:incube/component/Responsive.dart';
import 'package:incube/pages/Screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const Screen(),
          ),
          (route) => false);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Incube'),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Responsive(
            Mobile: Column(
              children: [
                Image.asset(
                  'assets/Logo.png',
                  height: 500.0,
                  width: 250.0,
                )
              ],
            ),
            Tablet: Column(
              children: [
                Image.asset(
                  'assets/Logo.png',
                  height: 500.0,
                  width: 250.0,
                ),
              ],
            ),
          )),
    );
  }
}
