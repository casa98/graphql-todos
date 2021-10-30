import 'package:flutter/material.dart';

import 'get_todos.dart';
import 'post_todo.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Private ToDos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                  ),
                ),
                const SizedBox(width: 16.0),
                PostToDo(controller: controller),
              ],
            ),
          ),
          const GetToDos(),
        ],
      ),
    );
  }
}
