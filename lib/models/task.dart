class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  bool toggleDone() {
    return isDone = !isDone;
  }

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        isDone = json['age'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'isDone': isDone,
      };
}
