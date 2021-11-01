import 'package:flutter/material.dart';
import 'package:flutter_graphql/todo_details_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/todo_item.dart';
import '../config/query_strings.dart';

class GetToDos extends StatelessWidget {
  const GetToDos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(QueryStrings.getPrivateTodos),
        variables: {"is_public": false},
        //pollInterval: const Duration(seconds: 10),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Expanded(
            child: Center(child: Text(result.exception.toString())),
          );
        }

        if (result.isLoading) {
          return const Expanded(
            child: Center(child: Text('Loading...')),
          );
        }

        final List<TodoItem> todos = (result.data?['todos'] as List<dynamic>)
            .map((e) => TodoItem.fromElements(e))
            .toList();
        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              TodoItem todo = todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text('Is Completed: ${todo.isCompleted}'),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ToDoDetails(todo: todo),
                    ),
                  );
                  refetch!();
                },
              );
            },
          ),
        );
      },
    );
  }
}
