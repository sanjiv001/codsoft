
class TaskModel {
  late String taskId;
  late String task;
  late String taskdetail;
  late int dt;

  TaskModel({
    required this.taskId,
    required this.task,
    required this.taskdetail,
    required this.dt,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      taskId: map['nodeId'],
      task: map['task'],
      taskdetail: map['taskdetail'],
      dt: map['dt'],
    );
  }
}