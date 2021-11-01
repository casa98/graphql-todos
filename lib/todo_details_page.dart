import 'package:flutter/material.dart';
import 'package:flutter_graphql/main.dart';
import 'package:flutter_graphql/models/todo_item.dart';
import 'package:flutter_graphql/query_strings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ToDoDetails extends StatefulWidget {
  final TodoItem todo;
  const ToDoDetails({
    Key? key,
    required this.todo,
  }) : super(key: key);

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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(widget.todo.title),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Edit'),
                ),
                const SizedBox(width: 8.0),
                Mutation(
                    options: MutationOptions(
                      document: gql(QueryStrings.deleteTodo),
                      onCompleted: (value) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content:
                              Text('Todo successfully deleted from database'),
                        ));
                      },
                      onError: (value) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content:
                              Text('Something went wrong deleting your todo'),
                        ));
                      },
                    ),
                    builder: (RunMutation runMutation, QueryResult? result) {
                      return ElevatedButton(
                        onPressed: () {
                          runMutation({'id': widget.todo.id});
                        },
                        child: const Text('Delete'),
                      );
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
