import 'package:auth_with_otp/pages/ProfileSelectionScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyPhoneScreen extends StatefulWidget {

  final String phone;
  VerifyPhoneScreen(this.phone);

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Phone'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify Phone',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('Code is sent to 8094504845'),
            SizedBox(height: 16),
            TextField(
              controller: otpcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the 6-digit code',
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Resend code
              },
              child: Text('Didn\'t receive the code? Request Again'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                AuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationID,
                    smsCode: otpcontroller.text);
                signin(phoneAuthCredential);
              },
              child: Text('VERIFY AND CONTINUE'),
            ),
          ],
        ),
      ),
    );
  }

  void signin(AuthCredential phoneAuthCredential) async {
    try {
      final authCred = await _auth.signInWithCredential(phoneAuthCredential);

      if (authCred.user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfileSelectionScreen()));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Some Error Occured. Try Again Later')));
    }
  }
}