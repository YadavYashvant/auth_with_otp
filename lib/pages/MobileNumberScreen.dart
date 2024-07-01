import 'package:auth_with_otp/components/primarybtn.dart';
import 'package:auth_with_otp/pages/VerifyPhoneScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileNumberScreen extends StatefulWidget {

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Mobile Number 001'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Please enter your mobile number',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Text(
                'You\'ll receive a 6 digit code to verify next.',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),

            ),
            SizedBox(height: 32),
            Row(
              children: [
                /*Text('+91'),
                SizedBox(width: 8),*/
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      hintText: 'Phone Number',
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text('+91'),
                      ),
                    ),
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    controller: _controller,
                  ),
                ),
              ],
            ),
            SizedBox(height: 48),
            PrimaryButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VerifyPhoneScreen(_controller.text)));
                },
                text: "CONTINUE")
            /*GFButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VerifyPhoneScreen(_controller.text)));
              },
              text: 'CONTINUE',
              size: GFSize.LARGE,
              textStyle: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),*/
          ],
        ),
      ),
    );
  }

}