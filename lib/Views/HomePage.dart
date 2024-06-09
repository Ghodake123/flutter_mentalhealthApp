import 'package:flutter/material.dart';
import 'MoodTracking.dart';
import 'Journaling.dart';
import 'Resources.dart';
import 'SelfAssessment.dart';
import 'Settings.dart';
import 'TherapistFinder.dart';
import 'GoalsandProgressTracking.dart';
import 'FeedbackandSupport.dart';
import 'EmergencyResource.dart';
import 'CommunitySupport.dart';
import 'guider.dart';
import 'chat.dart';
import 'Calender.dart'; // Import the EventCalendar page

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> moodWidgets = [
      _buildClickableMoodWidget(context, Icons.sentiment_very_satisfied, 'Happy',),
      _buildClickableMoodWidget(context, Icons.sentiment_satisfied, 'Neutral'),
      _buildClickableMoodWidget(context, Icons.sentiment_dissatisfied, 'Sad'),
      _buildClickableMoodWidget(context, Icons.sentiment_very_dissatisfied, 'Very sad'),
      _buildClickableMoodWidget(context, Icons.mood_bad, 'Angry'),
      _buildClickableMoodWidget(context, Icons.mood_bad, 'Cry'),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Sakshi!!",
                    style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/girl.jpg'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => guider()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Color(0xFF7165D6),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Color(0xFF7165D6),
                            size: 35,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Popular Guider",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Let's meet them",
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  EventCalendar()), // Navigate to EventCalendar page
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFF0EEFA),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.home_filled,
                            color: Color(0xFF7165D6),
                            size: 35,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Upcoming Event",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Mental health",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "How are you feeling today?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search anything',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  // Handle search functionality here
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moodWidgets.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 2,
                        ),
                      ],
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: moodWidgets[index],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Mental health Solution",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.purple,
                ),
              ),
            ),
            SizedBox(height:10),
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: 800,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(21),
                  boxShadow: [],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildImageContainer('assets/images/self.jpg'),
                          _buildImageContainer('assets/images/stress.jpg'),
                          _buildImageContainer('assets/images/yoga2.jpg'),
                          _buildImageContainer('assets/images/group.jpg'),
                          _buildImageContainer('assets/images/diet.png'),
                          _buildImageContainer('assets/images/y.jpg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2// Number of columns
              ),
              itemCount: 8, // Number of buttons
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Navigate to the corresponding page based on the index
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MoodTrackerHomePage()),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => JournalingPage()),
                            );
                            break;
                          case 2:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SelfAssessmentPage()),
                            );
                            break;
                          case 3:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MentalHealthResourcesPage()),
                            );
                            break;
                          case 4:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CommunitySupportPage()),
                            );
                            break;
                          case 5:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => GoalsandProgressTracking()),
                            );
                            break;
                          case 6:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TherapistFinderAndSupport()),
                            );
                            break;
                          case 7:
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>FeedbackAndSupportApp()),
                            );
                            break;
                        }
                      },
                      icon: _getIconForIndex(index),
                      label: _getLabelForIndex(index),
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(_getColorForIndex(index)), // Background color based on the index
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text/icon color
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                ),
                ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (int index) {
          // Handle navigation here based on the index
          switch (index) {
            case 0:
            // Navigate to Home screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
            // Navigate to Chats screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatPage()),
              );
              break;
            case 2:
            // Navigate to Emergency Resources screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmergencyResources()),
              );
              break;
            case 3:
            // Navigate to Settings screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Emergency support',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }

  // Function to build the mood widget
  Widget _buildClickableMoodWidget(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        // Navigate to the Mood Tracking page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MoodTrackerHomePage()),
        );
      },
      child: Column(
        children: [
          Icon(icon, size: 40,color: Colors.orangeAccent),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Function to get the icon for each button based on index
  Icon _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icon(Icons.mood);
      case 1:
        return Icon(Icons.note);
      case 2:
        return Icon(Icons.assignment_turned_in);
      case 3:
        return Icon(Icons.info);
      case 4:
        return Icon(Icons.people);
      case 5:
        return Icon(Icons.track_changes);
      case 6:
        return Icon(Icons.group);
      case 7:
        return Icon(Icons.settings);
      default:
        return Icon(Icons.error); // Placeholder icon
    }
  }

  // Function to get the label for each button based on index
  Text _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return Text('Mood Tracking');
      case 1:
        return Text('Journaling/Thought Recording');
      case 2:
        return Text('Self-Assessment Tools');
      case 3:
        return Text('Resources and Information');
      case 4:
        return Text('Community Support');
      case 5:
        return Text('Goals and Progress Tracking');
      case 6:
        return Text('Therapist Finder and Support');
      case 7:
        return Text('Feedback and Support');
      default:
        return Text('Error'); // Placeholder text
    }
  }

  // Function to get the color for each button based on index
  Color _getColorForIndex(int index) {
    switch (index) {
      case 0:
        return Colors.pinkAccent;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.deepPurpleAccent;
      case 4:
        return Colors.blue;
      case 5:
        return Colors.orange;
      case 6:
        return Colors.deepPurpleAccent;
      case 7:
        return Colors.greenAccent;
      case 8:
        return Colors.blueGrey;
      default:
        return Colors.redAccent;
    }
  }
}
