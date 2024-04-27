import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/component/Responsive.dart';
import 'package:incube/pages/Dashboard.dart';
import 'package:incube/pages/Forget.dart';
import 'package:incube/pages/Navbar.dart';
import 'package:incube/pages/Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool passwordVisible = true;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
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
                decoration: BoxDecoration(color: Colors.white),
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
                      Gap(10),
                      Text(
                        'To keep connected with us please login with your personal info',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Gap(20),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                      ),
                      Gap(5),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      Gap(40),
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                      ),
                      Gap(5),
                      TextField(
                        obscureText: !passwordVisible,
                        controller: password,
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
                      Gap(15),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          child: Text(
                            'Forget Password ?',
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Color(0xFF2F80ED)),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Forget(),
                                ));
                          },
                        ),
                      ),
                      Gap(40),
                      Container(
                          height: 44,
                          width: 400,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Color(0xFFFFB800),
                            ),
                            child: Text(
                              'Log In',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Color(0xFFFFFFFF)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BotNav()));
                            },
                          )),
                      Gap(20),
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
                                        fontSize: 12, color: Color(0xFF2F80ED)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Register(),
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
                decoration: BoxDecoration(color: Colors.white),
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
                      Gap(10),
                      Text(
                        'To keep connected with us please login with your personal info',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Gap(20),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                      ),
                      Gap(5),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      Gap(40),
                      Text(
                        'Password',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                      ),
                      Gap(5),
                      TextField(
                        obscureText: !passwordVisible,
                        controller: password,
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
                      Gap(15),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          child: Text(
                            'Forget Password ?',
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Color(0xFF2F80ED)),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Forget(),
                                ));
                          },
                        ),
                      ),
                      Gap(40),
                      Container(
                          height: 44,
                          width: 720,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Color(0xFFFFB800),
                            ),
                            child: Text(
                              'Log In',
                              style: GoogleFonts.poppins(
                                  fontSize: 14, color: Color(0xFFFFFFFF)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BotNav()));
                            },
                          )),
                      Gap(20),
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
                                        fontSize: 12, color: Color(0xFF2F80ED)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Register(),
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
}
