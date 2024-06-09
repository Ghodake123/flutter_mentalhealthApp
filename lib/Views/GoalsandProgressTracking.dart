import 'package:flutter/material.dart';

class GoalsandProgressTracking extends StatefulWidget {
  @override
  _GoalsandProgressTrackingState createState() =>
      _GoalsandProgressTrackingState();
}

class _GoalsandProgressTrackingState extends State<GoalsandProgressTracking> {
  List<String> goals = [];
  TextEditingController _goalTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals and Progress Tracking'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://i0.wp.com/strixus.com/wp-content/uploads/Progress-toward-goal-scaled.jpg?resize=1536%2C1025&ssl=1'), // Replace with your network image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Text(
              'Set Personal Goals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _goalTextController,
              decoration: InputDecoration(
                hintText: 'Enter your goal...',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white, // Ensure the background is white
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_goalTextController.text.isNotEmpty) {
                  setState(() {
                    goals.add(_goalTextController.text);
                    _goalTextController.clear();
                  });
                }
              },
              child: Text('Add Goal'),
            ),
            SizedBox(height: 20),
            Text(
              'Your Goals:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(goals[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          goals.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Progress Tracking:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Simple progress tracking widget
            Container(
              height: 50,
              color: Colors.white,
              child: Center(child: Text('Progress: 50%')),
            ),
            SizedBox(height: 20),
            Text(
              'Reminders and Encouragement:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Motivating thoughts
            Text(
                'Keep going! Youre making progress!',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            'Every step counts towards your well-being.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
    ],
    ),
    );
  }
}
