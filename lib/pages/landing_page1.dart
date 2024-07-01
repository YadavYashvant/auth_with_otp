import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';
import 'package:auth_with_otp/pages/MobileNumberScreen.dart';

class LandingPage1 extends StatefulWidget {
  const LandingPage1({Key? key}) : super(key: key);

  @override
  _LandingPage1State createState() => _LandingPage1State();
}

class _LandingPage1State extends State<LandingPage1> {
  final List<String> _languages = ['English', 'Hindi'];
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset('assets/svgs/layer1.svg', fit: BoxFit.cover, width: MediaQuery.of(context).size.width)
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset('assets/svgs/layer2.svg', fit: BoxFit.cover, width: MediaQuery.of(context).size.width)
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SvgPicture.asset(
                    'assets/svgs/layer3.svg',
                  ),
                  SizedBox(height: 32),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Please select your Language',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'You can change the language at any time.',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 32),
                      DropdownButton<String>(
                        value: _selectedLanguage,
                        items: _languages.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLanguage = newValue!;
                          });
                        },
                      ),
                      SizedBox(height: 32),
                      GFButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MobileNumberScreen()),
                          );
                        },
                        text: "Next",
                        size: GFSize.LARGE,
                      )
                      /*ElevatedButton(
                        onPressed: () {
                          // Navigate to the next screen
                        },
                        child: Text('Next'),
                      ),*/
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}