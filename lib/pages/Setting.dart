import 'package:flutter/material.dart';
import 'package:incube/component/Responsive.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isVisible = true;
  bool isVisible2 = true;
  bool isSwitched = true;
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Settings', style: GoogleFonts.poppins(fontSize: 24)),
        centerTitle: true,
      ),
      body: Responsive(
        Mobile: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'inCube Settings',
                  style: GoogleFonts.poppins(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildSettingSection(
              title: 'inCube 1',
              isVisible: isVisible,
              onToggle: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: _buildSubSetting(
                title: 'Cooling Fan',
                isVisible: isVisible2,
                onToggle: () {
                  setState(() {
                    isVisible2 = !isVisible2;
                  });
                },
              ),
            ),
          ],
        ),
        Tablet: Center(
          child: Text(
            'Tablet View - Under Development',
            style: GoogleFonts.poppins(fontSize: 24),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingSection({
    required String title,
    required bool isVisible,
    required VoidCallback onToggle,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: onToggle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
              ),
              Icon(
                isVisible ? Icons.arrow_drop_down : Icons.arrow_right,
                color: Colors.black,
              ),
            ],
          ),
        ),
        if (!isVisible) child,
      ],
    );
  }

  Widget _buildSubSetting({
    required String title,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: onToggle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                ),
                Icon(
                  isVisible ? Icons.arrow_drop_down : Icons.arrow_right,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          if (!isVisible)
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    title: Text(
                      'Fan Status',
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
