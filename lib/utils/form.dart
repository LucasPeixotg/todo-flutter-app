import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  const TaskForm(this.onSubmit);
  final Function onSubmit;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: theme.colorScheme.onSurface,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: theme.primaryColor,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Escreva algo';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              widget.onSubmit(_formKey);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Criar'),
            ),
          )
        ],
      ),
    );
  }
}
