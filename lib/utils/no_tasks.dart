import 'package:flutter/material.dart';

class NoTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headlineMedium!.copyWith();

    return Text(
      style: titleStyle,
      textAlign: TextAlign.center,
      'Você não possui nenhuma tarefa pendente',
    );
  }
}
