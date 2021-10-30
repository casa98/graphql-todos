class TodoItem {
  late int id;
  late String title = "";
  late bool isCompleted = false;

  TodoItem.fromElements(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isCompleted = json['is_completed'];
  }

  Map toJson() {
    Map jsonData = {
      "__typename": "todos",
      "id": id,
      "title": title,
      "is_completed": isCompleted,
    };
    return jsonData;
  }
}
