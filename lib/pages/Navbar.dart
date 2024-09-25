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
    const Dashboard(),
    const Setting(),
  ];

  @override
  void initState() {
    super.initState();
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: Responsive(
        Mobile: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor:
                currentTab == 1 ? const Color(0xFFFFB800) : Colors.white,
            shape: const CircleBorder(),
            child: Image.asset('assets/Logo3.png'),
            onPressed: () {
              setState(() {
                currentScreen = const Product();
                currentTab = 1;
              });
            },
          ),
        ),
        Tablet: SizedBox(
          width: 100,
          height: 100,
          child: FloatingActionButton(
            backgroundColor:
                currentTab == 1 ? const Color(0xFFFFB800) : Colors.white,
            shape: const CircleBorder(),
            child: Image.asset('assets/Logo3.png'),
            onPressed: () {
              setState(() {
                currentScreen = const Product();
                currentTab = 1;
              });
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 0,
            child: Responsive(
              Mobile: SizedBox(
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
                              currentScreen = const Dashboard();
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
                              const Text('Dashboard')
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = const Setting();
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
                              const Text('Settings')
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
                              currentScreen = const Report();
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
                              const Text('Report')
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = const Profile();
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
                              const Text('Profile')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Tablet: SizedBox(
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
                            currentScreen = const Dashboard();
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
                            const Text('Dashboard')
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 100,
                        onPressed: () {
                          setState(() {
                            currentScreen = const Setting();
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
                            const Text('Settings')
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
                            currentScreen = const Report();
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
                            const Text('Report')
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 100,
                        onPressed: () {
                          setState(() {
                            currentScreen = const Profile();
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
                            const Text('Dashboard')
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
