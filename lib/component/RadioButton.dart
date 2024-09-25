import 'package:flutter/material.dart';

class SettingItems extends StatefulWidget {
  const SettingItems({super.key});

  @override
  State<SettingItems> createState() => _SettingItemsState();
}

class _SettingItemsState extends State<SettingItems> {
  bool light0 = true;
  bool light1 = true;

   final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          value: light0,
          onChanged: (bool value) {
            setState(() {
              light0 = value;
            });
          },
        ),
     ]);
  }
}
