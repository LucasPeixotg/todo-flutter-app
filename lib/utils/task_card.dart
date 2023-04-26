import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontSize: 26,
    );

    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.5,
      child: Card(
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Center(
            child: Text(
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              title,
            ),
          ),
        ),
      ),
    );
  }
}
