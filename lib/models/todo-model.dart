class Todo {
  final int id;
  final String title;
  bool completed;

  Todo({required this.id, required this.title, required this.completed});

  Map<String, dynamic> toJson() =>
      {'todo_id': id, 'title': title, 'completed': completed};
}
