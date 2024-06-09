import 'package:flutter/material.dart';

class Video {
  final String title;
  final String description;
  final String imageUrl;

  Video({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class guider extends StatelessWidget {
  final List<Video> videos = [
    Video(
      title: "Overcoming Anxiety",
      description: "Learn techniques to overcome anxiety and improve mental health.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqIlSkZWE1h1aXhZPl8HTskAl0zUVkAnOvFgOL_dUblb5tqSD1VtWpfa7uOcegFrwz-ck&usqp=CAU", // Replace with actual URL
    ),
    Video(
      title: "Dealing with Depression",
      description: "Discover ways to cope with depression and find support.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ0wJo_xkNH-VcDom9SJ8NV1wQP7rb-xcuhx8bT8amVOG9HteYZswtzivt2hCpQpbhSRA&usqp=CAU", // Replace with actual URL
    ),
    Video(
      title: "Building Resilience",
      description: "Develop resilience skills to bounce back from life's challenges.",
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSER5MMqUrc6VJa0D7t4u94RlKsAlMGiMmPGw&s"
    ),
      Video(
      title: "Stress Management",
      description: "Explore strategies to manage stress and maintain well-being.",
      imageUrl: "https://www.simplylifeindia.com/uploads/8/1/1/5/8115412/vikram-patel-speaker-simply-life-india.jpg"
      ),
    Video(
        title: "Stress Management",
        description: "Explore strategies to manage stress and maintain well-being.",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDbTWFLrLlpvFwcm9fy-t_bhOqsCnzg7SuOA&s"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Mental Health guider"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Handle video tap
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(videos[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              videos[index].title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              videos[index].description,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
