import 'package:flutter/material.dart';
import 'package:todo_app/pages/new_task_page.dart';
import 'package:todo_app/utils/no_tasks.dart';
import 'package:uuid/uuid.dart';

import '../utils/task_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> tasks = [];

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  void procrastinate() {
    setState(() {
      String first = tasks.removeAt(0);
      tasks.add(first);
    });
  }

  void conclude() {
    setState(() {
      tasks.removeAt(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentTask;
    if (tasks.isNotEmpty) {
      currentTask = Dismissible(
        key: Key(Uuid().v1()),
        confirmDismiss: (direction) {
          if (direction == DismissDirection.endToStart && tasks.length == 1) {
            return Future.value(false);
          }
          return Future.value(true);
        },
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            conclude();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 1000),
                content: Text('Tarefa concluída'),
                backgroundColor: Color(0xFF2AB825),
              ),
            );
          } else {
            procrastinate();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 1000),
                content: Text('Tarefa procrastinada'),
                backgroundColor: Color(0xFFB82A20),
              ),
            );
          }
        },
        child: TaskCard(title: tasks[0]),
      );
    } else {
      currentTask = Padding(
        padding: const EdgeInsets.only(top: 100),
        child: NoTasks(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'TO DO',
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewTaskPage(onSubmit: (text) {
                addTask(text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      duration: Duration(milliseconds: 1000),
                      content: Text('Nova tarefa adicionada')),
                );
              }),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 10,
        ),
        child: currentTask,
      ),
    );
  }
}
