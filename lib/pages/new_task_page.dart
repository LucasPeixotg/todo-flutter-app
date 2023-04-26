import 'package:flutter/material.dart';
import 'package:todo_app/utils/form.dart';

class NewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headlineMedium!.copyWith(
      color: theme.colorScheme.onSurface,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'NOVA TAREFA',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Text('Adicionar Nova Tarefa', style: titleStyle),
            SizedBox(height: 40),
            TaskForm(() {}),
          ],
        ),
      ),
    );
  }
}
