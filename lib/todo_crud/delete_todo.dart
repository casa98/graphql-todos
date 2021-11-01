import 'package:flutter/material.dart';
import 'package:flutter_graphql/models/todo_item.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../config/query_strings.dart';

class DeleteToDo extends StatelessWidget {
  final TodoItem todo;
  const DeleteToDo({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(QueryStrings.deleteTodo),
        onCompleted: (value) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Todo successfully deleted from database'),
          ));
        },
        onError: (value) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Something went wrong deleting your todo'),
          ));
        },
      ),
      builder: (RunMutation runMutation, QueryResult? result) {
        return ElevatedButton(
          onPressed: () {
            runMutation({'id': todo.id});
          },
          child: const Text('Delete'),
        );
      },
    );
  }
}
