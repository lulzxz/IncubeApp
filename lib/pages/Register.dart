import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incube/component/Responsive.dart';
import 'package:incube/pages/Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                              Gap(10),
                              Text(
                                'Enter your personal details and starts journey with us',
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Gap(20),
                              Text(
                                'Name',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Gap(5),
                              TextField(
                                controller: email,
                                decoration: InputDecoration(
                                    hintText: 'Name',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                              Gap(40),
                              Text('Email'),
                              Gap(5),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
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
                                        ? Icons.visibility
                                        : Icons.visibility_off),
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
                              Gap(20),
                              RichText(
                                text: TextSpan(
                                    text: 'Dengan mendaftar, Anda menyetujui ',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: 'Kebijakan Privasi ',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Color(0xFF2F80ED)),
                                      ),
                                      TextSpan(text: 'serta '),
                                      TextSpan(
                                        text: 'Syarat dan Ketentuan ',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Color(0xFF2F80ED)),
                                      ),
                                      TextSpan(text: 'dari Kami')
                                    ]),
                              ),
                              Gap(40),
                              Container(
                                  height: 44,
                                  width: 400,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: Color(0xFF2F80ED),
                                    ),
                                    child: Text(
                                      'Register',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFFFFFFFF)),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login()));
                                    },
                                  )),
                            ]))),
                Tablet: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 50),
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
                              Gap(10),
                              Text(
                                'Enter your personal details and starts journey with us',
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Gap(20),
                              Text(
                                'Name',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Gap(5),
                              TextField(
                                controller: email,
                                decoration: InputDecoration(
                                    hintText: 'Name',
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                              Gap(40),
                              Text('Email'),
                              Gap(5),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
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
                                        ? Icons.visibility
                                        : Icons.visibility_off),
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
                              Gap(20),
                              RichText(
                                text: TextSpan(
                                    text: 'Dengan mendaftar, Anda menyetujui ',
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: 'Kebijakan Privasi ',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Color(0xFF2F80ED)),
                                      ),
                                      TextSpan(text: 'serta '),
                                      TextSpan(
                                        text: 'Syarat dan Ketentuan ',
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Color(0xFF2F80ED)),
                                      ),
                                      TextSpan(text: 'dari Kami')
                                    ]),
                              ),
                              Gap(40),
                              Container(
                                  height: 44,
                                  width: 720,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      backgroundColor: Color(0xFF2F80ED),
                                    ),
                                    child: Text(
                                      'Register',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Color(0xFFFFFFFF)),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login()));
                                    },
                                  )),
                            ]))))));
  }
}
