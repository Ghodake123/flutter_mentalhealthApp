import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class FeedbackAndSupportApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback & Support',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BackgroundImagePage(),
    );
  }
}

class BackgroundImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/FeedBackSupport.jpeg"), // Replace this with your actual image path
            fit: BoxFit.cover,
          ),
        ),
        child: FeedbackAndSupportPage(),
      ),
    );
  }
}

class FeedbackAndSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FEEDBACK AND SUPPORT'),
      ),
      body: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}




class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _feedbackController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image; // This will hold the selected image file
  String? _feedbackType;
  final List<String> _feedbackOptions = [
    'Login Trouble',
    'Personal Profile',
    'Other Issue',
    'Suggestions',
  ];

  // Method to handle image selection
  Future<void> _pickImage() async {
    final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Text(
            'We value your feedback!',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Text(
            'Please select the type of feedback:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          ..._feedbackOptions.map((option) => RadioListTile(
            title: Text(option),
            value: option,
            groupValue: _feedbackType,
            onChanged: (value) {
              setState(() {
                _feedbackType = value as String?;
              });
            },
          )),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF6A1B9A)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Type your feedback or support request here...',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          InkWell(
            onTap: _pickImage,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF6A1B9A)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.blue),
                  SizedBox(width: 10),
                  Text('Upload screenshot (optional)'),
                  SizedBox(width: 10),
                  if (_image != null) ...[
                    Text('File selected'),
                    Icon(Icons.check, color: Colors.green),
                  ],
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              _submitFeedback();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6A1B9A)),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              ),
            ),
            child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitFeedback() {
    String feedback = _feedbackController.text;
    String imagePath = _image?.path ?? "No Image Selected";
    print('Feedback type: $_feedbackType');
    print('Feedback submitted: $feedback');
    print('Image Path: $imagePath');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feedback Submitted'),
          content: Text('Thank you for your feedback!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context). pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    _feedbackController.clear();
  }
}