import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  final Map data;
  const NextPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data["name"],
          ),
          Text(
            data["username"],
          ),
          Text(
            data["email"],
          ),
          Text(
            data["phone"],
          ),
          Text(
            data["website"],
          ),
          Text(
            data["company"]["name"],
          ),
        ],
      ),
    );
  }
}
