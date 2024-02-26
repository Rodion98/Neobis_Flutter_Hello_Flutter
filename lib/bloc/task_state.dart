part of 'task_bloc.dart';

enum TaskStatus { initial, loading, success, error }

@immutable
class TaskState extends Equatable {
  final List<Task> tasks;
  final TaskStatus status;

  const TaskState(
      {this.tasks = const <Task>[], this.status = TaskStatus.initial});

  TaskState copyWith({
    List<Task>? tasks,
    TaskStatus? status,
  }) {
    return TaskState(tasks: tasks ?? this.tasks, status: status ?? this.status);
  }

  @override
  factory TaskState.fromJson(Map<String, dynamic> json) {
    try {
      // print(json);
      var listOfTasks = (json['task'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList();
      print(listOfTasks);

      return TaskState(
          tasks: listOfTasks,
          status: TaskStatus.values
              .firstWhere((element) => element.toString() == json['status']));
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {'task': tasks, 'status': status.toString()};
  }

  @override
  List<Object?> get props => [tasks, status];
}
