import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/blog_screen.dart';
import 'package:portfolio_app/screens/contact_screen.dart';
import 'package:portfolio_app/screens/home_screen.dart';
import 'package:portfolio_app/screens/project_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/project': (context) => const ProjectScreen(),
        '/blog': (context) => const BlogScreen(),
        '/contact': (context) => const ContactScreen(),
      },
    );
  }
}
