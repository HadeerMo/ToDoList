part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TaskLoading extends TaskState {}

final class TaskSuccess extends TaskState {
  TaskSuccess({required this.tasks});
  final List<Task> tasks;
}

final class TaskFailure extends TaskState {
  TaskFailure({required this.errorMsg});
  final String errorMsg;
}
