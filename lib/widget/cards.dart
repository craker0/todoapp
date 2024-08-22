// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String title;
  final bool status;
  final Function changer;
  final int index;
  final Function delete;

  const Cards({
    super.key,
    required this.title,
    required this.status,
    required this.changer,
    required this.index,
    required this.delete,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changer(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(7),
            color: const Color.fromARGB(255, 71, 39, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
                Row(
                  children: [
                    Icon(
                      status ? Icons.check : Icons.close,
                      color: status ? Colors.green : Colors.red,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          delete(index);
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 25,
                          color: const Color.fromARGB(255, 238, 2, 2),
                        ))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
