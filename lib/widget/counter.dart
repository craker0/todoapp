// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {

  final int fullTasks;
  final int completedTasks;

  const Counter({super.key, 
    required this.fullTasks,
    required this.completedTasks
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: Text(
        "$completedTasks/$fullTasks",
        style: TextStyle(fontSize: 37, color: completedTasks==fullTasks ? Colors.green: Colors.white),
      ),
    );
  }
}
