import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:special_app/models/Comment.dart';
import 'package:special_app/models/post.dart';
import 'package:special_app/models/story.dart';
import 'package:special_app/models/user.dart';
import 'package:special_app/widgets/Post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Story> stories = List<Story>.generate(
    10,
    (index) => Story(
        id: index.toString(),
        image:
            "https://images.unsplash.com/photo-1566438480900-0609be27a4be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80"),
  );

  final List<PostModel> posts = List<PostModel>.generate(
    10,
    (index) => PostModel(
      id: index.toString(),
      user: User(
        id: index.toString() + "random",
        avatar: faker.image.image(),
        name: faker.person.name(),
      ),
      comments: List<Comment>.generate(
        3,
        (index) => Comment(
          id: index.toString(),
          name: faker.person.name(),
          content: faker.lorem.sentence(),
          avatar: faker.image.image(),
        ),
      ),
      description: faker.lorem.sentence(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: NetworkImage(stories[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Post(posts[index]);
                },
                itemCount: stories.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
