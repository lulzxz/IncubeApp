import 'package:flutter/material.dart';
import 'package:incube/component/Responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Report',
          style: GoogleFonts.poppins(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Responsive(
        Mobile: Column(
          children: [
            SizedBox(
              child: Row(children: [
                TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Incube 1',
                        ),
                        Icon(
                          isVisible ? Icons.arrow_drop_down : Icons.arrow_right,
                          color: Colors.black,
                        ),
                      ],
                    ))
              ]),
            )
          ],
        ),
        Tablet: Text(''),
      ),
    );
  }
}
