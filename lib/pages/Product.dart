import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Product', style: GoogleFonts.poppins(fontSize: 20)),
      ),
      body: Center(
        child: Text('Product'),
      ),
    );
  }
}
