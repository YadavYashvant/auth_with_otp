import 'package:flutter/material.dart';

class ProfileSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Selection 001'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please select your profile',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.local_shipping),
              title: Text('Shipper'),
              subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              onTap: () {
                // Handle shipper selection
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Transporter'),
              subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              onTap: () {
                // Handle transporter selection
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle continue action
              },
              child: Text('CONTINUE'),
            ),
          ],
        ),
      ),
    );
  }
}