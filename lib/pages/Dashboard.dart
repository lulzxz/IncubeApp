import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:incube/component/Responsive.dart';
import 'package:incube/component/tes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Responsive(
                Mobile: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome Back!',
                          style: GoogleFonts.poppins(fontSize: 24),
                        ),
                        Container(
                            height: 250,
                            child: Expanded(child: BarChartSample2())),
                        Gap(10),
                        TextButton(
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool("onboarding", false);
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Text('Incube 1',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.black)),
                        ),
                        Visibility(
                          visible: !isVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFFFCC3F)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Temperature',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFB4D2FF)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Humidity',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(10),
                        Visibility(
                          visible: !isVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFFFCC3F)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Temperature',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFB4D2FF)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Humidity',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Tablet: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome Back!',
                          style: GoogleFonts.poppins(fontSize: 24),
                        ),
                        Container(
                            height: 300,
                            child: Expanded(child: BarChartSample2())),
                        Gap(10),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Text('Incube',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Colors.black)),
                        ),
                        Visibility(
                          visible: !isVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFFFCC3F)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Temperature',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                width: 160,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFFB4D2FF)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Humidity',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
