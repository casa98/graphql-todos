import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/todo_item.dart';
import '../config/query_strings.dart';

class UpdateToDo extends StatelessWidget {
  const UpdateToDo({Key? key, required this.todo}) : super(key: key);

  final TodoItem todo;

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(QueryStrings.updateTodo),
        onCompleted: (value) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Todo successfully edited from database'),
          ));
        },
        onError: (value) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Something went wrong editing your todo'),
          ));
        },
      ),
      builder: (RunMutation runMutation, QueryResult? result) {
        return ElevatedButton(
          onPressed: () {
            runMutation({
              'id': todo.id,
              'title': todo.title + ' updated',
            });
          },
          child: const Text('Edit'),
        );
      },
    );
  }
}
