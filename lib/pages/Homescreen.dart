import 'package:flutter/material.dart';
import 'package:incube/component/Responsive.dart';
import 'package:incube/pages/Login.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Register.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
            Mobile: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xFFFFB800),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/loginbg.png'))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logoin.png'),
                    const Gap(50),
                    SizedBox(
                        height: 44,
                        width: 280,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                        )),
                    const Gap(20),
                    SizedBox(
                        height: 44,
                        width: 280,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2F7BED)),
                          child: Text(
                            'Register',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          },
                        ))
                  ]),
            ),
            Tablet: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xFFFFB800),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/loginbg.png'))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logoin.png'),
                    const Gap(50),
                    SizedBox(
                        height: 44,
                        width: 328,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          },
                        )),
                    const Gap(20),
                    SizedBox(
                        height: 44,
                        width: 328,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2F7BED)),
                          child: Text(
                            'Register',
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          },
                        ))
                  ]),
            )));
  }
}
