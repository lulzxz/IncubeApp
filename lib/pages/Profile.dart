import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:incube/pages/Login.dart';
import 'package:incube/pages/toast.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String username = 'User';
  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  Future<void> _fetchUsername() async {
    if (currentUser == null) return;

    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();

      if (doc.exists) {
        setState(() {
          username = doc.data()?['username'] ?? 'User';
        });
      } else {
        setState(() {
          username = 'User';
        });
      }
    } catch (e) {
      print('Error Fetching Username : $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unable to Fetch Username!')),
      );
    }
  }

  void _logout() async {
    try {
      await _auth.signOut();
      showToast(message: "Logged out successfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    } catch (e) {
      showToast(message: "Failed to log out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile', style: GoogleFonts.poppins(fontSize: 20)),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Text('Logout'),
              IconButton(
                icon: Icon(Icons.logout, color: Colors.red),
                onPressed: _logout,
                tooltip: 'Logout',
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),
            Text(
              username,
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              currentUser?.email ?? 'Email not available',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Information',
                        style: GoogleFonts.poppins(fontSize: 16)),
                    // subtitle: Text(username,
                    //     style: GoogleFonts.poppins(fontSize: 14)),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notification',
                        style: GoogleFonts.poppins(fontSize: 16)),
                    // subtitle: Text(currentUser?.email ?? 'Not available',
                    //     style: GoogleFonts.poppins(fontSize: 14)),
                  ),
                  ListTile(
                    leading: Icon(Icons.question_mark_outlined),
                    title: Text(
                      'Help',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
