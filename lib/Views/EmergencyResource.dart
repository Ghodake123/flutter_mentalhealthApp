import 'package:flutter/material.dart';

class EmergencyResources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Resources'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EmergencyContactCard(
              title: 'National Suicide Prevention Lifeline',
              phoneNumber: '1-800-273-TALK (8255)',
            ),
            EmergencyContactCard(
              title: 'Crisis Text Line',
              phoneNumber: 'Text HOME to 741741',
            ),
            EmergencyContactCard(
              title: 'Emergency Services',
              phoneNumber: 'Dial 911',
            ),
            SizedBox(height: 16.0),
            Text(
              'What to Do in a Mental Health Crisis:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. Stay calm and reassure the person in crisis.',
            ),
            Text(
              '2. Listen to them without judgment and validate their feelings.',
            ),
            Text(
              '3. Encourage them to seek professional help immediately.',
            ),
            Text(
              '4. Stay with them until help arrives, if possible.',
            ),
            // Add more guidance as needed
          ],
        ),
      ),
    );
  }
}

class EmergencyContactCard extends StatelessWidget {
  final String title;
  final String phoneNumber;

  const EmergencyContactCard({
    Key? key,
    required this.title,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(phoneNumber),
        onTap: () {
          // You can add logic here to call the emergency number
          // or open a messaging app to text the crisis line
        },
      ),
    );
  }
}
