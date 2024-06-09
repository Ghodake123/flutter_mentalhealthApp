import 'package:flutter/material.dart';

class JournalingPage extends StatefulWidget {
  @override
  _JournalingPageState createState() => _JournalingPageState();
}

class _JournalingPageState extends State<JournalingPage> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _tagEditingController = TextEditingController();
  List<String> tags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Journaling/Thought Recording',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://paperit.in/cdn/shop/products/PocketDiariesmockup3.jpg?v=1664458417&width=800/500x500'), // Background image URL
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.black), // Thicker border
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: _textEditingController,
                    maxLines: null,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Write your thoughts here...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent, // Transparent background
                  border: Border.all(width: 2.0, color: Colors.black), // Thicker border
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _tagEditingController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Add tags (optional)',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        if (_tagEditingController.text.isNotEmpty) {
                          setState(() {
                            tags.add(_tagEditingController.text);
                            _tagEditingController.clear();
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Tags: ${tags.join(", ")}',
                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 150, // Adjust the width as needed
                child: ElevatedButton(
                  onPressed: () {
                    String entry = _textEditingController.text;
                    print('Entry: $entry');
                    print('Tags: $tags');
                    _textEditingController.clear();
                    setState(() {
                      tags.clear();
                    });
                  },
                  child: Text('Save Entry'),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Prompts or Suggestions for Guided Journaling:',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8.0),
              Text(
                '1. What made you happy today?',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '2. What challenges did you face?',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '3. What are you grateful for?',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
