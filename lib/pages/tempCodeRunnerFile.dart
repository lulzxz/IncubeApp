import 'package:flutter/material.dart';

class tugas extends StatefulWidget {
  const tugas({super.key});

  @override
  State<tugas> createState() => _tugasState();
}

class _tugasState extends State<tugas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        child: const Text('Hello World!'),
      ),
    );
  }
}