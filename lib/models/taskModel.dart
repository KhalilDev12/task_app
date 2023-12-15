class TaskModel {
  final int userId;
  final int id;
  String title;
  bool completed;

  TaskModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "id": id,
      "title": title,
      "completed": completed,
    };
  }
}
