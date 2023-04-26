import 'package:flutter/material.dart';
import 'package:todo_app/utils/form.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key, required this.onSubmit});
  final Function onSubmit;

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
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 60),
              child: Text('Adicionar Nova Tarefa', style: titleStyle),
            ),
            TaskForm(onSubmit: (String text) {
              onSubmit(text);
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
