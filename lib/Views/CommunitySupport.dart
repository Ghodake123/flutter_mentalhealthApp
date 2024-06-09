import 'package:flutter/material.dart';

class CommunitySupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Forum'),
        backgroundColor: Colors.blue,
      ),
      body: ForumList(), // Display the list of forum posts
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a page to create a new forum post
          // You can implement this functionality as needed
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Widget to display the list of forum posts
class ForumList extends StatefulWidget {
  @override
  _ForumListState createState() => _ForumListState();
}

class _ForumListState extends State<ForumList> {
  List<ForumPost> _forumPosts = [
    ForumPost(
      author: 'John Doe',
      content:
      'I\'ve been feeling anxious lately and having trouble sleeping. Does anyone have any advice on how to cope with anxiety?',
      timestamp: '2 hours ago',
    ),
    ForumPost(
      author: 'Alice Smith',
      content:
      'I\'ve been struggling with depression for a while now. Can anyone recommend any good self-help books or resources?',
      timestamp: '1 day ago',
    ),
    // Add more forum posts here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _forumPosts.length,
      itemBuilder: (context, index) {
        return ForumPostWidget(forumPost: _forumPosts[index]);
      },
    );
  }
}

// Widget to display a single forum post
class ForumPostWidget extends StatelessWidget {
  final ForumPost forumPost;

  ForumPostWidget({required this.forumPost});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Author: ${forumPost.author}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              forumPost.content,
            ),
            SizedBox(height: 10),
            Text(
              'Posted: ${forumPost.timestamp}',
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 10),
            // Add interaction buttons like Reply, Like, etc. here
          ],
        ),
      ),
    );
  }
}

// Model class for a forum post
class ForumPost {
  final String author;
  final String content;
  final String timestamp;

  ForumPost({
    required this.author,
    required this.content,
    required this.timestamp,
  });
}
