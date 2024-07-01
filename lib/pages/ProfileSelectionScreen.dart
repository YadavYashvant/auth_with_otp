import 'package:auth_with_otp/components/primarybtn.dart';
import 'package:auth_with_otp/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSelectionScreen extends StatefulWidget {
  @override
  _ProfileSelectionScreenState createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  String? _selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Please select your profile',
              style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: mblue
                ),
              ),
              child: RadioListTile<String>(
                value: 'Shipper',
                groupValue: _selectedProfile,
                title: Row(
                  children: [
                    Icon(Icons.local_shipping), // Add your icon for Shipper
                    SizedBox(width: 8),
                    Text('Shipper'),
                  ],
                ),
                subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                onChanged: (value) {
                  setState(() {
                    _selectedProfile = value;
                  });
                },
              ),
            ),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: mblue
                ),
              ),
              child: RadioListTile<String>(
                value: 'Transporter',
                groupValue: _selectedProfile,
                title: Row(
                  children: [
                    Icon(Icons.directions_car), // Add your icon for Transporter
                    SizedBox(width: 8),
                    Text('Transporter'),
                  ],
                ),
                subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                onChanged: (value) {
                  setState(() {
                    _selectedProfile = value;
                  });
                },
              ),
            ),
            SizedBox(height: 40),

            PrimaryButton(onPressed: () {}, text: "CONTINUE")

          ],
        ),
      ),
    );
  }
}