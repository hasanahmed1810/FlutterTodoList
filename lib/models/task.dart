class Task {
  final String name;
  bool isDone;
  final id;

  Task({this.name, this.isDone = false, this.id});

  bool toggleDone() {
    return isDone = !isDone;
  }
}
