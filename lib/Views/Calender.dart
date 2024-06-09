import 'package:flutter/material.dart';

class EventCalendar extends StatefulWidget {
  @override
  _EventCalendarState createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  List<Map<String, String>> events = [];

  TextEditingController dateController = TextEditingController();
  TextEditingController eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
      ),
      body: Stack(
        children: [
          // Background Image
          Image.network(
            'https://wpamelia.com/wp-content/uploads/2023/07/modern.jpg', // Replace with your image URL
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Event:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                          hintText: 'Date',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: eventController,
                        decoration: InputDecoration(
                          hintText: 'Event',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        String date = dateController.text;
                        String event = eventController.text;
                        if (date.isNotEmpty && event.isNotEmpty) {
                          setState(() {
                            events.add({'date': date, 'event': event});
                          });
                          dateController.clear();
                          eventController.clear();
                        } else {
                          // Show a snackbar or some feedback for empty fields
                        }
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Saved Events:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(events[index]['date'] ?? ''),
                        subtitle: Text(events[index]['event'] ?? ''),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    dateController.dispose();
    eventController.dispose();
    super.dispose();
  }
}
