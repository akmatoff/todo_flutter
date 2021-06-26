class Todo {
  final int id;
  final String title;
  bool completed;

  Todo({required this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['todo_id'] as int,
        title: json['title'] as String,
        completed: json['completed'] as bool);
  }

  Map<String, dynamic> toJson() =>
      {'todo_id': id, 'title': title, 'completed': completed};
}
