import 'package:flutter/material.dart';

import 'todo_crud/get_todos.dart';
import 'main.dart';
import 'todo_crud/post_todo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with RouteAware {
  final controller = TextEditingController();
  int counter = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPush() {
    print('1 didPush');
    super.didPush();
  }

  @override
  void didPushNext() {
    print('1 didPushNext');
    super.didPushNext();
  }

  @override
  void didPop() {
    print('1 didPop');
    super.didPop();
  }

  @override
  void didPopNext() {
    print('1 didPopNext');
    super.didPopNext();
  }

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

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
