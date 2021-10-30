class QueryStrings {
  static const getPrivateTodos = """
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

  static const postPrivateTodo ="""
    mutation addTodo(\$title: String!, \$isPublic: Boolean!) {
      action: insert_todos(objects: {is_public: \$isPublic, title: \$title}) {
      returning {
        id
        is_public
      }
    }
  }""";
}
