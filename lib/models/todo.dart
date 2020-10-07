class Todo {
  String text;
  bool done;
  TodoModel todoModel;

  Todo({this.text, this.done = false, this.todoModel});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        text: json['text'],
        done: json['done'],
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'done': done,
      };
}

class TodoModel {
  int count;
  TodoModel({this.count});
}
