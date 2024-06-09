import 'package:flutter/material.dart';

class SelfAssessmentPage extends StatefulWidget {
  @override
  _SelfAssessmentPageState createState() => _SelfAssessmentPageState();
}

class _SelfAssessmentPageState extends State<SelfAssessmentPage> {
  List<Question> questions = [
    Question('Do you often feel nervous, anxious, or on edge?'),
    Question('Do you worry excessively about various aspects of your life?'),
    Question('Do you have trouble controlling feelings of worry or nervousness?'),
    Question('Do you experience restlessness or have trouble relaxing?'),
    Question('Do you often feel easily fatigued or tired?'),
    Question('Do you have difficulty concentrating on tasks?'),
    Question('Do you experience irritability or have a short temper?'),
    Question('Do you have muscle tension or physical symptoms such as trembling or sweating?'),
    Question('Do you have trouble falling asleep or staying asleep due to worrying thoughts?'),
    Question('Do you avoid certain situations or activities because they make you feel anxious?'),
    Question('Do you experience sudden or intense feelings of panic or fear?'),
    Question('Do you have frequent stomachaches or other physical complaints without a medical cause?'),
    Question('Do you experience a sense of impending doom or danger?'),
    Question('Do you have difficulty making decisions because of anxiety?'),
    Question('Do you feel like your anxiety interferes with your daily life or relationships?'),
  ];

  int currentIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Self-Assessment Tools'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.herzindagi.info/image/2023/Dec/anxiety-disorder-symptoms-coping-techniques.jpg'), // Replace with your network image URL
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Anxiety Assessment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              if (currentIndex < questions.length)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question ${currentIndex + 1}: ${questions[currentIndex].questionText}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          score += 1; // Increase score for each 'Yes' answer
                          currentIndex++;
                        });
                      },
                      child: Text('Yes'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentIndex++;
                        });
                      },
                      child: Text('No'),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    Text(
                      'Assessment Result:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your anxiety score is: $score',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      getFeedback(score),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  String getFeedback(int score) {
    if (score <= 5) {
      return 'Your anxiety level is low. Keep practicing good mental health habits!';
    } else if (score <= 10) {
      return 'Your anxiety level is moderate. Consider seeking professional advice if it persists.';
    } else {
      return 'Your anxiety level is high. It is recommended to consult a mental health professional.';
    }
  }
}

class Question {
  final String questionText;

  Question(this.questionText);
}
