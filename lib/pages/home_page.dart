import 'package:flutter/material.dart';
import 'package:todo_app/pages/new_task_page.dart';
import 'package:uuid/uuid.dart';

import '../utils/task_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
              builder: (context) => NewTaskPage(),
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
        child: Dismissible(
          key: Key(Uuid().v1()),
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              print('delete');
            } else {
              print('dont delete');
            }
          },
          child: TaskCard(title: 'TESTE'),
        ),
      ),
    );
  }
}
