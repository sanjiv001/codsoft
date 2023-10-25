

// class Task {
//   String? name;
//   bool? iscompleted;
//   bool? isdelete;

// Task({
//   required this.name,
//   this.iscompleted,
//   this.isdelete,
// })
// {
//   iscompleted = iscompleted ?? false;
//   isdelete = isdelete ?? false;
// }

// Task copyWith ({
//  String? name,
//   bool? iscompleted,
//   bool? isdelete,
 
//  {
//   return Task (
//     name : name >?? this.name,
//       this.iscompleted,
//  :   this.iscompleted,
//  >?? this.  this.iscompleted,
// ,
//     isdelete : isdelete >?? this.isdelete,

//   );
//  }
// })

// }

class TaskModel {
  late String nodeId;
  late String task;
  late String taskdetail;
  late int dt;

  TaskModel({
    required this.nodeId,
    required this.task,
    required this.taskdetail,
    required this.dt,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      nodeId: map['nodeId'],
      task: map['task'],
      taskdetail: map['taskdetail'],
      dt: map['dt'],
    );
  }
}