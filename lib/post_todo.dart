import 'package:flutter/material.dart';
import 'package:flutter_graphql/query_strings.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PostToDo extends StatelessWidget {
  const PostToDo({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(QueryStrings.postPrivateTodo),
        onCompleted: (value) {
          controller.clear();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Todo successfully created in database'),
          ));
        },
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Something went wrong saving your todo'),
          ));
        },
      ),
      builder: (RunMutation runMutation, QueryResult? result) {
        return ElevatedButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              runMutation({
                'title': controller.text,
                'isPublic': false,
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('Add some description to your todo'),
              ));
            }
          },
          child: const Text('Save'),
        );
      },
    );
  }
}
