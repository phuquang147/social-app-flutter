import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:special_app/models/post.dart';
import 'package:special_app/widgets/Friend.dart';
import 'package:special_app/widgets/Photo.dart';
import 'package:special_app/widgets/Post.dart';
import 'package:special_app/widgets/SectionTitle.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text((args as PostModel).user.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
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
                margin: EdgeInsets.fromLTRB(0, 16, 0, 60),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: const Image(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: -50,
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image(
                            image: NetworkImage(
                              (args as PostModel).user.avatar,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle("Bio"),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            faker.lorem.sentence(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SectionTitle("Friends"),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: const [
                              Friend(),
                              Friend(),
                              Friend(),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Load more"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitle("Images"),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: const [
                              Photo(),
                              Photo(),
                              Photo(),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Load more"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Post(args as PostModel),
            ],
          ),
        ),
      ),
    );
  }
}
