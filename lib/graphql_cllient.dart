import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static final HttpLink httpLink = HttpLink('https://hasura.io/learn/graphql');

  static const  _token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJjYXNhOThAdHV0YW5vdGEuY29tIiwibmFtZSI6ImNhc2E5OCIsImlhdCI6MTYzNTY5OTUwMy43MDIsImlzcyI6Imh0dHBzOi8vaGFzdXJhLmlvL2xlYXJuLyIsImh0dHBzOi8vaGFzdXJhLmlvL2p3dC9jbGFpbXMiOnsieC1oYXN1cmEtYWxsb3dlZC1yb2xlcyI6WyJ1c2VyIl0sIngtaGFzdXJhLXVzZXItaWQiOiJjYXNhOThAdHV0YW5vdGEuY29tIiwieC1oYXN1cmEtZGVmYXVsdC1yb2xlIjoidXNlciIsIngtaGFzdXJhLXJvbGUiOiJ1c2VyIn0sImV4cCI6MTYzNTc4NTkwM30.509fBJVe5Eqa-JKy4tOlTf_gvkk8wgNN63NIDFLVvsY";

  static final AuthLink authLink = AuthLink(getToken: () => _token);

  static final Link link = authLink.concat(httpLink);

  static String? token;

  static ValueNotifier<GraphQLClient> initailizeClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      ),
    );
    return client;
  }
}
