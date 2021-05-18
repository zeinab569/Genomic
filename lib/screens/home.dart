
import 'package:flutter/material.dart';
import 'package:theblast/helpers/screen_navigation.dart';

import 'BlastDetail.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
        title: "Blast",
        home: Scaffold(

            body: SafeArea(
                bottom: false,
                top: false,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://static.scientificamerican.com/blogs/cache/file/26CA8EE6-FB9B-433C-B7CA176592F97539_source.jpg?w=590&h=800&2FF06ADF-00EB-4A58-87B6F2261AFD2842"),
                        fit: BoxFit.cover,
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 100, right: 240, bottom: 20),

                    child: ListView(
                      children: <Widget>[
                        Center(
                            child: Text("Blast",
                              style: TextStyle(
                                  fontSize: 70,
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            )
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 15),
                          child: GestureDetector(
                            onTap: () {
                              changeScreen(context, HomeScreen());
                            },
                            child: Container(
                                padding: const EdgeInsets.only(
                                    top: 13, right: 10, left: 10, bottom: 13),
                                color: Colors.tealAccent,
                                child: Text('Get Started -->', style: TextStyle(
                                    fontSize: 19, color: Colors.black),)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            )

        )


    );
  }
  }