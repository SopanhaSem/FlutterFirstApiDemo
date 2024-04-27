import 'dart:math';

import 'package:first_api_app/src/controller/post_controller.dart';
import 'package:first_api_app/src/model/user_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  List<Welcome> welcomeList = [];
  getDataWelcome() async {
    await WelcomeController().getWelcome().then((value) => {
          setState(() {
            welcomeList = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    getDataWelcome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: const Text("Demo Api"),
        centerTitle: true,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: welcomeList.length,
          itemBuilder: (context, index) => Column(
                children: [
                  _buildPostCardWidget(welcome: welcomeList[index]),
                  const Divider(
                    color: Colors.grey, // Color of the line
                    height: 20, // Height of the line (thickness)
                    thickness: 2, // Thickness of the line
                    indent: 20, // Indentation from the left
                    endIndent: 20,
                  ),
                ],
              )),
    );
  }
}

Widget _buildPostCardWidget({required Welcome welcome}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              maxRadius: 30,
              backgroundImage: NetworkImage(welcome.image),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              welcome.title.trim().substring(0, min(10, welcome.title.length)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(welcome.content
              .trim()
              .substring(0, min(20, welcome.title.length))),
        ),
        Container(
          width: double.infinity,
          height: 300,
          margin: const EdgeInsets.only(top: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(welcome.thumbnail),
            ),
          ),
        ),
      ],
    ),
  );
}
