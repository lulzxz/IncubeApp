import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget Mobile;
  final Widget Tablet;

  const Responsive({
    Key? key,
    required this.Mobile,
    required this.Tablet, 
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 650) {
          return Tablet;
        }
        return Mobile;
      },
    );
  }
}
