import 'package:flutter/material.dart';
import 'package:flutter_graphql/main.dart';
import 'package:flutter_graphql/models/todo_item.dart';

class ToDoDetails extends StatefulWidget {
  final TodoItem todo;
  const ToDoDetails({Key? key, required this.todo}) : super(key: key);

  @override
  State<ToDoDetails> createState() => _ToDoDetailsState();
}

class _ToDoDetailsState extends State<ToDoDetails> with RouteAware {
  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }

  @override
  void didPush() {
    print('2 didPush');
    super.didPush();
  }

  @override
  void didPushNext() {
    print('2 didPushNext');
    super.didPushNext();
  }

  @override
  void didPop() {
    print('2 didPop');
    super.didPop();
  }

  @override
  void didPopNext() {
    print('2 didPopNext');
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Container(),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
