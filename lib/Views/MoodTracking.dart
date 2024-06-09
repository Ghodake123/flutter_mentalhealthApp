import 'package:flutter/material.dart';



// Helper function to create a MaterialColor from a Color
MaterialColor createMaterialColor(Color color) {
  List<double> strengths = <double>[.05];
  Map<int, Color> swatch = {};
  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      color.red + ((255 - color.red) * ds).round(),
      color.green + ((255 - color.green) * ds).round(),
      color.blue + ((255 - color.blue) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

// Define your app structure including Routes and Theme
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood and Daily Quiz App',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF6A1B9A)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/': (context) => MoodTrackerHomePage(),
        '/dailyQuiz': (context) => DailyQuizPage(),
        '/moodResult': (context) => MoodResultPage(answers: List<String>.filled(10, 'Neutral')), // Corrected placeholder
        '/congratsPage': (context) => CongratsPage(),
      },
    );
  }
}





class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          color: Colors.white, // Changed to white as mentioned
          padding: EdgeInsets.all(8),
          child: Text(
            'MOOD TRACKER',
            style: TextStyle(fontSize: 24, color: Colors.white,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/moodtracing.jpeg"), // Replace with your asset image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Would you like to take this quiz?',
                  style: TextStyle(fontSize: 28, color: Colors.white), // Text color set to white
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/'),
                  icon: Icon(Icons.circle, size: 24),
                  label: Text('Yes'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class MoodTrackerHomePage extends StatefulWidget {
  @override
  _MoodTrackerHomePageState createState() => _MoodTrackerHomePageState();
}

class _MoodTrackerHomePageState extends State<MoodTrackerHomePage> {
  int selectedMood = 3;
  List<String> moodOptions = [
    '😀 Incredible',
    '😄 Great',
    '🙂 Good',
    '😐 Okay',
    '😢 Really Bad',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          color: Colors.white, // Example color
          padding: EdgeInsets.all(8),
          child: Text('MOOD TRACKER', style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("moodtracing.jpeg"), // Ensure this asset is available
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text('How was your day?', style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              ...moodOptions.map((option) => Card(
                child: ListTile(
                  title: Text(option),
                  leading: Radio<int>(
                    value: moodOptions.indexOf(option),
                    groupValue: selectedMood,
                    onChanged: (int? value) {
                      setState(() {
                        selectedMood = value!;
                      });
                    },
                  ),
                ),
                margin: EdgeInsets.all(10),
              )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/dailyQuiz'),
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






class DailyQuizPage extends StatefulWidget {
  @override
  _DailyQuizPageState createState() => _DailyQuizPageState();
}

class _DailyQuizPageState extends State<DailyQuizPage> {
  List<String> questions = [
    "I easily feel sad when the people around me feel sad.",
    "Today, I felt that my life was full of interesting things",
    "I was able to relax without feeling anxious today",
    "My levels of energy were high throughout the day.",
    "When someone else is feeling excited, I tend to get excited too",
    "I felt confident about handling personal problems today",
    "I have tender, concerned feelings for people less fortunate than me.",
    "I felt down, depressed, or hopeless at times today",
    "I felt that today was a step forward in a positive direction",
    "Did you feel valued or appreciated by others today?",
  ];

  List<String> answers = List.filled(10, 'Neutral');

  List<String> responseOptions = [
    'Strongly Agree',
    'Agree',
    'Neutral',
    'Disagree',
    'Strongly Disagree'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Text('DAILY QUIZ', style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("moodtracing.jpeg"), // Ensure this asset is available
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.separated(
          padding: EdgeInsets.all(10),
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(questions[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ...responseOptions.map((String option) {
                      return RadioListTile<String>(
                        title: Text(option),
                        value: option,
                        groupValue: answers[index],
                        onChanged: (String? value) {
                          setState(() {
                            answers[index] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 10),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You'll need to define MoodResultPage for this navigation to work
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoodResultPage(answers: answers),
            ),
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}



class MoodResultPage extends StatelessWidget {
  final List<String> answers;

  MoodResultPage({required this.answers});

  int calculateMoodScore() {
    int score = 0;
    for (String answer in answers) {
      switch (answer) {
        case 'Strongly Agree':
          score += 2;
          break;
        case 'Agree':
          score += 1;
          break;
        case 'Neutral':
          break;
        case 'Disagree':
          score -= 1;
          break;
        case 'Strongly Disagree':
          score -= 2;
          break;
      }
    }
    return score;
  }

  String getMoodText(int score) {
    if (score >= 9) {
      return "😄 Very Happy";
    } else if (score >= 7) {
      return "😊 Happy";
    } else if (score >= 5) {
      return "😐 Neutral";
    } else if (score >= 3) {
      return "😔 Sad";
    } else if (score >= 1) {
      return "😢 Very Sad";
    } else {
      return "No rating available";
    }
  }

  int getStarCount(int score) {
    if (score >= 9) {
      return 5;
    } else if (score >= 7) {
      return 4;
    } else if (score >= 5) {
      return 3;
    } else if (score >= 3) {
      return 2;
    } else if (score >= 1) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    int score = calculateMoodScore();
    String moodText = getMoodText(score);
    int starCount = getStarCount(score);

    List<Widget> stars = List.generate(starCount, (index) => Icon(Icons.star, color: Colors.yellow, size: 50));

    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Text("Your Mood Results", style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("moodtracing.jpeg"), // Ensure this asset is available in your project
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                color: Colors.white.withOpacity(0.8), // Using a semi-transparent white color for better readability
                child: Text(moodText, style: TextStyle(fontSize: 26), textAlign: TextAlign.center),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: stars,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Back to Quiz'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // You'll need to define CongratsPage for this navigation to work
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CongratsPage()),
                  );
                },
                child: Text('Go to Congrats Page'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class CongratsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6A1B9A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Icon(Icons.check, size: 50, color: Colors.green),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Thanks for completing the mood tracker!',
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Move to Home page'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue[900],
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}