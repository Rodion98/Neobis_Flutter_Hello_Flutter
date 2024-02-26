class Task {
  final String task;
  // int id;

  Task({
    this.task = '',
    // required this.id
  });

  Task copyWith({
    String? task,
    // int? id,
  }) {
    return Task(task: task ?? this.task);
    //  id: id ?? this.id)
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(task: json['task']
        // id: json['id']
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'task': task
      // 'id' : id
    };
  }

  @override
  String toString() {
    return '''Task: {task: $task\n}''';
  }
}
