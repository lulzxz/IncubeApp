import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/component/Responsive.dart';
import 'package:incube/auth/firebase_auth_service.dart';
import 'package:incube/pages/toast.dart';
import 'package:incube/pages/Navbar.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool isSigningUp = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Responsive(
          Mobile: _buildRegisterForm(),
          Tablet: _buildRegisterForm(),
        ),
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Register',
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const Gap(10),
            Text(
              'Enter your personal details and start your journey with us',
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Gap(20),
            Text(
              'Username',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Gap(5),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const Gap(40),
            Text(
              'Email',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Gap(5),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const Gap(40),
            Text(
              'Password',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Gap(5),
            TextField(
              obscureText: !passwordVisible,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
            const Gap(20),
            RichText(
              text: TextSpan(
                text: 'By signing up, you agree to our ',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: 'Privacy Policy ',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF2F80ED),
                    ),
                  ),
                  const TextSpan(text: 'and '),
                  TextSpan(
                    text: 'Terms of Service',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFF2F80ED),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(40),
            GestureDetector(
              onTap: () => _signUp(),
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: isSigningUp
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);
      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'username': username,
          'email': email,
          'password': password,
        });
        showToast(message: "User Created");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BotNav()),
        );
      } else {
        showToast(message: "Registration failed");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'The email address is already in use.');
      } else if (e.code == 'invalid-email') {
        showToast(message: 'The email address is badly formatted.');
      } else if (e.code == 'weak-password') {
        showToast(message: 'The password provided is too weak.');
      } else {
        showToast(message: 'An error occurred: ${e.message}');
      }
    } catch (e) {
      showToast(message: e.toString());
    } finally {
      setState(() {
        isSigningUp = false;
      });
    }
  }
}
