import 'package:flutter/material.dart';
import 'package:incube/component/Responsive.dart';
import 'package:incube/pages/Dashboard.dart';
import 'package:incube/pages/Product.dart';
import 'package:incube/pages/Profile.dart';
import 'package:incube/pages/Report.dart';
import 'package:incube/pages/Setting.dart';

class BotNav extends StatefulWidget {
  const BotNav({super.key});

  @override
  State<BotNav> createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
  int currentTab = 0;
  final List<Widget> screens = [
    Dashboard(),
    Setting(),
  ];

  @override
  void initState() {
    super.initState();
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Responsive(
        Mobile: Container(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: currentTab == 1 ? Color(0xFFFFB800) : Colors.white,
            shape: CircleBorder(),
            child: Image.asset('assets/Logo3.png'),
            onPressed: () {
              setState(() {
                currentScreen = Product();
                currentTab = 1;
              });
            },
          ),
        ),
        Tablet: Container(
          width: 100,
          height: 100,
          child: FloatingActionButton(
            backgroundColor: currentTab == 1 ? Color(0xFFFFB800) : Colors.white,
            shape: CircleBorder(),
            child: Image.asset('assets/Logo3.png'),
            onPressed: () {
              setState(() {
                currentScreen = Product();
                currentTab = 1;
              });
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          notchMargin: 0,
          child: Responsive(
            Mobile: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Dashboard();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.dashboard,
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                            Text('Dashboard')
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Setting();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.settings,
                                color: currentTab == 2
                                    ? Colors.blue
                                    : Colors.grey),
                            Text('Settings')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Report();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.stacked_line_chart,
                                color: currentTab == 3
                                    ? Colors.blue
                                    : Colors.grey),
                            Text('Report')
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = Profile();
                            currentTab = 4;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_outline_rounded,
                                color: currentTab == 4
                                    ? Colors.blue
                                    : Colors.grey),
                            Text('Dashboard')
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Tablet: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 100,
                        onPressed: () {
                          setState(() {
                            currentScreen = Dashboard();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.dashboard,
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                            Text('Dashboard')
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 100,
                        onPressed: () {
                          setState(() {
                            currentScreen = Setting();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.settings,
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                            Text('Settings')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 100,
                        onPressed: () {
                          setState(() {
                            currentScreen = Report();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.stacked_line_chart,
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                            Text('Report')
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 100,
                        onPressed: () {
                          setState(() {
                            currentScreen = Profile();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_outline_rounded,
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                            Text('Dashboard')
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
