import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home view"),
        actions: [
          IconButton(
            onPressed: () {
             
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
