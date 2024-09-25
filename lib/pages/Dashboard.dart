import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';
import 'package:incube/component/Responsive.dart';
import 'package:incube/component/tes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String suhu = '0';
  String Hum = '0';
  bool isVisible = true;
  String username = 'User';
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    FetchRealtime();
    if (currentUser != null) {
      _fetchUserName();
    }
  }

  void FetchRealtime() {
    DatabaseReference ref = FirebaseDatabase.instance.ref('sensor');
    ref.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<String, dynamic> data =
            Map<String, dynamic>.from(event.snapshot.value as Map);
        setState(() {
          suhu = data['suhu'].toString();
          Hum = data['kelembapan'].toString();
        });
      }
    });
  }

  Future<void> _fetchUserName() async {
    if (currentUser == null) return;

    try {
      // Fetch user document from Firestore
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();

      if (doc.exists) {
        // Update the state with fetched username
        setState(() {
          username = doc.data()?['username'] ??
              'User'; // Default to 'User' if no username
        });
      } else {
        setState(() {
          username = 'User'; // Default username if the document does not exist
        });
      }
    } catch (e) {
      print('Error fetching username: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Unable to fetch username. Please check your connection and try again.'),
        ),
      );
    }
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacementNamed(
          '/login'); // Adjust this route based on your app's structure
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign out: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Dashboard', style: GoogleFonts.poppins(fontSize: 20)),
        centerTitle: true,
        
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Responsive(
                Mobile: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome Back, $username!', 
                          style: GoogleFonts.poppins(fontSize: 24),
                        ),
                        const SizedBox(
                            height: 250,
                            child:
                                BarChartSample2()), 
                        const Gap(10),
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
                          visible: isVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFFFFCC3F)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Temperature',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                      Gap(4),
                                      Text(
                                        '$suhu °C',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFFB4D2FF)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Humidity',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      Text(
                                        '$Hum %',
                                        style: GoogleFonts.poppins(
                                            fontSize: 14, color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
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
                                    color: const Color(0xFFFFCC3F)),
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
                                    color: const Color(0xFFB4D2FF)),
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
                Tablet: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Welcome Back, $username!', // Display the username
                          style: GoogleFonts.poppins(fontSize: 24),
                        ),
                        const SizedBox(
                            height: 300,
                            child:
                                BarChartSample2()), // Removed Expanded widget
                        const Gap(10),
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
                                    color: const Color(0xFFFFCC3F)),
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
                                    color: const Color(0xFFB4D2FF)),
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
