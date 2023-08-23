import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
        title: Text('Home'),
        centerTitle: true,
        
      ),
      body: ListView(
        children: [
          Text("Hi users"),
        ],
      )
    );
  }
}