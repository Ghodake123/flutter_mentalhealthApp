import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class MentalHealthResourcesPage extends StatelessWidget {
  final List<CategoryData> categories = [
    CategoryData(
      categoryName: 'Stress Management',
      imageUrl: 'assets/images/stress management.jpeg',
      resources: [
        ResourceDetail(
          title: '5 Ways to Manage Stress',
          content: 'Learn about 5 effective methods to reduce your stress levels, including exercise, meditation, and proper sleep.',
          url: 'https://www.marumeditation.org',
        ),
      ],
    ),
    CategoryData(
      categoryName: 'Anxiety Relief',
      imageUrl: 'assets/images/anxiety relief.jpeg',
      resources: [
        ResourceDetail(
          title: 'Techniques for Anxiety Relief',
          content: '1. Start with a growth mindset\n2. Breathe\n3. Talk yourself through it\n4. Face the situation — don\'t wait for anxiety to go away',
          url: 'https://www.youtube.com/watch?v=McCDfP5M878',
        ),
      ],
    ),
    CategoryData(
      categoryName: 'Depression Help',
      imageUrl: 'assets/images/depression.jpeg',
      resources: [
        ResourceDetail(
          title: 'Understanding Depression',
          content: 'Learn more about depression and its effects, including strategies for managing symptoms.',
          url: 'https://www.betterhealth.vic.gov.au/health/conditionsandtreatments/depression-treatment-and-management',
        ),
      ],
    ),
    CategoryData(
      categoryName: 'Sleep Hygiene',
      imageUrl: 'assets/images/sleep hiegne.jpeg', // Make sure this image is in your assets folder
      resources: [
        ResourceDetail(
            title: 'Improving Sleep Quality',
            content: 'Tips on improving sleep hygiene for a better night\'s sleep\n1. Stick to a Sleep Schedule\n2. Create a Bedtime Routine\n3. Optimize Your Sleep Environment\n4. Choose a Comfortable Mattress and Pillows\n5. Get the Right Sunlight Exposure',
            url: 'https://www.youtube.com/watch?v=-HtzWrwuHcI'
        ),
      ],
    ),
    CategoryData(
      categoryName: 'Meditation Techniques',
      imageUrl: 'assets/images/meditation technique.jpeg', // Make sure this image is in your assets folder
      resources: [
        ResourceDetail(
          title: 'Guided Meditation for Beginners',
          content: 'Start your meditation journey with these guided sessions.',
          url: 'https://www.innerpeacefellowship.org/how-to-meditate/?gad_source=1&gclid=CjwKCAjwrIixBhBbEiwACEqDJajXzYt8WihppnD5eoetnY21EHErzrJuL7LMFnV146eG6cObG7wL4BoC9xAQAvD_BwE',
        ),
      ],
    ),
    CategoryData(
      categoryName: 'Nutrition For Good Mental Health',
      imageUrl: 'assets/images/imagesNutrition For Good Mental Health.jpeg', // Make sure this image is in your assets folder
      resources: [
        ResourceDetail(
            title: 'The Role of Nutrition in Mental Health',
            content: 'Discover how your diet can affect your mental health.',
            url: 'https://www.youtube.com/watch?v=fhzn3IC7cc0'
        ),
      ],
    ),
    CategoryData(
      categoryName: 'Physical Activity',
      imageUrl: 'assets/images/physical activity.jpeg', // Make sure this image is in your assets folder
      resources: [
        ResourceDetail(
            title: 'Exercise for Mental Health',
            content: 'Learn about the mental benefits of regular physical activity.',
            url: 'https://www.healthdirect.gov.au/exercise-and-mental-health'
        ),
      ],
    ),
    CategoryData(
      categoryName: 'Books to Read',
      imageUrl: 'assets/images/books to read.jpeg', // Make sure this image is in your assets folder
      resources: [
        ResourceDetail(
            title: 'Atomic Habits',
            content: 'An insightful guide on how to build good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.\n1. Atomic Habits by James Clear.\n2. The Power of Habit by Charles Duhigg.\n3. Daily Rituals: How Artists Work by Mason Currey.\n4. Hooked by Nir Eyal.\n5. The Slight Edge by Jeff Olson.',
            url: 'https://www.freepsychotherapybooks.org'
        ),
      ],
    ),
    CategoryData(
      categoryName: 'Mindfulness',
      imageUrl: 'assets/images/mindfullness.jpeg', // Make sure this image is in your assets folder
      resources: [
        ResourceDetail(
            title: 'Introduction to Mindfulness',
            content: 'Learn what mindfulness is and how it can help reduce stress.',
            url: 'https://poppylifecare.com/mindfulness-and-meditation'
        ),
      ],
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health Resources'),
        backgroundColor: Color(0XFF80DEEA),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(category: categories[index]);
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoryData category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResourceCategory(
              categoryName: category.categoryName,
              resources: category.resources,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  category.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                category.categoryName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResourceCategory extends StatefulWidget {
  final String categoryName;
  final List<ResourceDetail> resources;

  const ResourceCategory({
    Key? key,
    required this.categoryName,
    required this.resources,
  }) : super(key: key);

  @override
  _ResourceCategoryState createState() => _ResourceCategoryState();
}

class _ResourceCategoryState extends State<ResourceCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        backgroundColor: Color(0XFF80DEEA),
      ),
      body: ListView.builder(
        itemCount: widget.resources.length,
        itemBuilder: (context, index) {
          ResourceDetail resource = widget.resources[index];
          return ListTile(
            title: Text(resource.title),
            subtitle: Text(resource.content),
            onTap: () => _launchURL(resource.url),
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}

class ResourceDetail {
  final String title;
  final String content;
  final String url;

  ResourceDetail({
    required this.title,
    required this.content,
    required this.url,
  });
}

class CategoryData {
  final String categoryName;
  final String imageUrl;
  final List<ResourceDetail> resources;

  CategoryData({
    required this.categoryName,
    required this.imageUrl,
    required this.resources,
  });
}