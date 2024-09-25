import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/auth/firebase_auth_service.dart';
import 'package:incube/component/Responsive.dart';
import 'package:incube/pages/Forget.dart';
import 'package:incube/pages/Navbar.dart';
import 'package:incube/pages/Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
  
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = true;
  bool _isSigning = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  void dispose() {
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
              Mobile: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Log In',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Gap(10),
                      Text(
                        'To keep connected with us please login with your personal info',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                      ),
                      const Gap(5),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      const Gap(40),
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                      ),
                      const Gap(5),
                      TextField(
                        obscureText: !passwordVisible,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                          alignLabelWithHint: false,
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      const Gap(15),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          child: Text(
                            'Forget Password ?',
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: const Color(0xFF2F80ED)),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Forget(),
                                ));
                          },
                        ),
                      ),
                      const Gap(40),
                      SizedBox(
                          height: 45,
                          width: 400,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: const Color(0xFFFFB800),
                            ),
                            child: Text(
                              'Log In',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: const Color(0xFFFFFFFF)),
                            ),
                            onPressed: () {
                              _signIn();
                            },
                          )),
                      Center(
                        child: _isSigning
                            ? CircularProgressIndicator(
                                color: Colors.blue,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                      const Gap(20),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Dont Have an Account?',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Colors.black),
                              children: [
                                TextSpan(
                                    text: ' Register',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: const Color(0xFF2F80ED)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Register(),
                                            ));
                                      })
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Tablet: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Log In',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Gap(10),
                      Text(
                        'To keep connected with us please login with your personal info',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                      ),
                      const Gap(5),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      const Gap(40),
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                      ),
                      const Gap(5),
                      TextField(
                        obscureText: !passwordVisible,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(
                                () {
                                  passwordVisible = !passwordVisible;
                                },
                              );
                            },
                          ),
                          alignLabelWithHint: false,
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                      const Gap(15),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          child: Text(
                            'Forget Password ?',
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: const Color(0xFF2F80ED)),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Forget(),
                                ));
                          },
                        ),
                      ),
                      const Gap(40),
                      SizedBox(
                          height: 44,
                          width: 720,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: const Color(0xFFFFB800),
                            ),
                            child: Text(
                              'Log In',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: const Color(0xFFFFFFFF)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BotNav()));
                            },
                          )),
                      const Gap(20),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Dont Have an Account?',
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Colors.black),
                              children: [
                                TextSpan(
                                    text: ' Register',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: const Color(0xFF2F80ED)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Register(),
                                            ));
                                      })
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      (message: "User is successfully signed in");
      Navigator.pushNamed(context, "/home");
    } else {
      (message: "some error occured");
    }
  }
}
