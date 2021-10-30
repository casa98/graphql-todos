class QueryStrings {
  static const String getPrivateTodos = """
    query getTodos(\$is_public: Boolean!){
      todos(where: { is_public: { _eq: \$is_public} },
      order_by: { created_at: desc }) {
        __typename
        id
        title
        is_completed
      }
    }
  """;
}