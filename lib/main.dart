import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/blogs_screen.dart';
import 'package:portfolio_app/screens/contacts_screen.dart';
import 'package:portfolio_app/screens/home_screen.dart';
import 'package:portfolio_app/screens/projects_screen.dart';
import 'package:portfolio_app/screens/settings_screen.dart';

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
        '/projects': (context) => const ProjectsScreen(),
        '/blogs': (context) => const BlogsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/contacts': (context) => const ContactsScreen(),
      },
    );
  }
}
