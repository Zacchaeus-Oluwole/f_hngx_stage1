// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool webPage = true;
  // This widget is the root of your application.

  final String githubUrl = 'https://github.com/Zacchaeus-Oluwole';
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(
        Uri.parse(githubUrl),
      );
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return webPage? MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                CircleAvatar(
                  radius: 130.0,
                  backgroundColor: Colors.teal,
                  backgroundImage: AssetImage("assets/zach.jpg"),
                ),
                Text(
                  'Zacchaeus Oluwole',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.teal.shade700),
                    ),
                    child: Text(
                      'Open Github',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: (){
                      setState(() {
                        webPage = !webPage;
                      });
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ) : MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: WebViewWidget(
            controller: _controller,
            ),
        ),
      ),
    );
  }
}


