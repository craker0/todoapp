// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_super_parameters, avoid_function_literals_in_foreach_calls

import 'package:final_todoapp/widget/cards.dart';
import 'package:final_todoapp/widget/counter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

// class to define Tasks
class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}

class _ToDoAppState extends State<ToDoApp> {
// List for all tasks
  List allTasks = [
    Task(title: "Call Mom", status: true),
    Task(title: "Call Dad", status: false),
    Task(title: "Gem", status: false),
    Task(title: "Solve Task", status: false),
  ];
// calculate completed Tasks
  int calcCompleted() {
    int completed = 0;
    allTasks.forEach((item) {
      if (item.status) {
        completed++;
      }
    });
    return completed;
  }

// change status for per task
  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

// delete partical task the container
  delete(int taskindex) {
    setState(() {
      allTasks.remove(allTasks[taskindex]);
    });
  }

// delete all tasks from app bar
  deleteAll() {
    setState(() {
      allTasks.removeRange(0, allTasks.length);
    });
  }

// add new task from floating button
  addNewTask() {
    setState(() {
      allTasks.add(Task(title: myController.text, status: false));
    });
  }

// define controller to textfeild
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(97, 158, 7, 7),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 3, 45, 65),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,
                          maxLength: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              addNewTask();
                              Navigator.pop(context);
                            },
                            child: Text("ADD"))
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(97, 158, 7, 7),
        elevation: 0,
        title: Text(
          "To Do App",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 33, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                deleteAll();
              },
              icon: Icon(
                Icons.delete_forever,
                size: 37,
                color: const Color.fromARGB(255, 250, 0, 0),
              ))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Counter(
                fullTasks: allTasks.length, completedTasks: calcCompleted()),
            Container(
              padding: EdgeInsets.only(bottom: 15),
              color: const Color.fromARGB(255, 53, 35, 49),
              height: 590,
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Cards(
                      index: index,
                      title: allTasks[index].title,
                      status: allTasks[index].status,
                      changer: changeStatus,
                      delete: delete,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
