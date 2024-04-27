import 'package:flutter/material.dart';

class SettingItems extends StatefulWidget {
  const SettingItems({super.key});

  @override
  State<SettingItems> createState() => _SettingItemsState();
}

enum Options { manual, auto }

class _SettingItemsState extends State<SettingItems> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    Options? _Options = Options.manual;

    return Scaffold(
        body: Row(children: <Widget>[
      RadioListTile<Options>(
          value: Options.manual,
          groupValue: _Options,
          onChanged: (Options? val) {
            setState(() {
              _Options = val;
            });
          }),
      RadioListTile<Options>(
          value: Options.auto,
          groupValue: _Options,
          onChanged: (Options? val) {
            setState(() {
              _Options = val;
            });
          }),
    ]));
  }
}
