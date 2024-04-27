import 'package:flutter/material.dart';
import 'package:incube/component/RadioButton.dart';
import 'package:incube/component/Responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

enum Options { manual, auto }

class _SettingState extends State<Setting> {
  bool isVisible = true;
  bool isVisible2 = true;
  bool isSwitched = true;
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    Options? _Options = Options.manual;
    return Scaffold(
      body: Responsive(
        Mobile: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(child: Text('Incube Setting')),
            ),
            Gap(10),
            TextButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Text('Incube 1',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
            Visibility(
              visible: !isVisible,
              child: Column(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isVisible2 = !isVisible2;
                                });
                              },
                              child: Text('Cooling Fan',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black)),
                            ),
                            Center(
                              child: Visibility(
                                visible: !isVisible2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Center(
                                          child: Text('Number of Fan : 2'),
                                        ),
                                        Transform.scale(
                                            scale: .5,
                                            child: Switch(
                                                value: isSwitched,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isSwitched = !isSwitched;
                                                  });
                                                })),
                                      ],
                                    ),
                                    Gap(10),
                                    Row(
                                      children: <Widget>[
                                        Text('Timing :'),
                                        SettingItems()
                                      ],
                                    ),
                                    Gap(36),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Start Temp : '),
                                            Text('40 Celcius')
                                          ],
                                        )
                                      ],
                                    ),
                                    Gap(10),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('End Temp : '),
                                            Text('30 Celcius')
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
        Tablet: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(child: Text('Incube Setting')),
            ),
            Gap(10),
            TextButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Text('Incube 1',
                  style:
                      GoogleFonts.poppins(fontSize: 14, color: Colors.black)),
            ),
            Visibility(
              visible: !isVisible,
              child: Column(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isVisible2 = !isVisible2;
                                });
                              },
                              child: Text('Cooling Fan',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black)),
                            ),
                            Center(
                              child: Visibility(
                                visible: !isVisible2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Center(
                                          child: Text('Number of Fan : 2'),
                                        ),
                                        Transform.scale(
                                            scale: .5,
                                            child: Switch(
                                                value: isSwitched,
                                                onChanged: (value) {
                                                  setState(() {
                                                    isSwitched = !isSwitched;
                                                  });
                                                })),
                                      ],
                                    ),
                                    Gap(10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Timing :'),

                                        // RadioListTile<Options>(
                                        //     title: Text('Manual'),
                                        //     value: Options.manual,
                                        //     groupValue: _optionsItems,
                                        //     onChanged: (Options? val) {
                                        //       setState(() {
                                        //         _optionsItems = val;
                                        //       });
                                        //     }),
                                        // RadioListTile<Options>(
                                        //     title: Text('Auto'),
                                        //     value: Options.auto,
                                        //     groupValue: _optionsItems,
                                        //     onChanged: (Options? val) {
                                        //       setState(() {
                                        //         _optionsItems = val;
                                        //       });
                                        //     }),

                                        // Expanded(
                                        //   child: RadioListTile(
                                        //       title: Text('Auto'),
                                        //       value: options[1],
                                        //       groupValue: currentOptions,
                                        //       onChanged: (val) {
                                        //         setState(() {
                                        //           currentOptions =
                                        //               val.toString();
                                        //         });
                                        //       }),
                                        // ),
                                      ],
                                    ),
                                    Gap(36),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Start Temp : '),
                                            Text('40 Celcius')
                                          ],
                                        )
                                      ],
                                    ),
                                    Gap(10),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('End Temp : '),
                                            Text('30 Celcius')
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
