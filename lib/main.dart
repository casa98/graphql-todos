import 'package:flutter/material.dart';
import 'package:flutter_graphql/graphql_cllient.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: GraphQLConfig.initailizeClient(),
      child: MaterialApp(
        title: 'GraphQL Demo',
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark(),
        home: MyHomePage(),
      ),
    );
  }
}

