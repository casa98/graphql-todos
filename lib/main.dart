import 'package:flutter/material.dart';
import 'package:flutter_graphql/graphql_cllient.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'todo_page.dart';

void main() {
  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLConfig.initailizeClient(),
      child: MaterialApp(
        navigatorObservers: [routeObserver],
        title: 'GraphQL Demo',
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark(),
        home: MyHomePage(),
      ),
    );
  }
}
