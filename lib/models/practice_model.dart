class Practice {
  int id;
  String title;
  String description;
  String form;
  DateTime dueTime;
  int coordinator;
  List<int> students;

  Practice({
    required this.id,
    required this.title,
    required this.description,
    required this.form,
    required this.dueTime,
    required this.coordinator,
    required this.students,
  });

  factory Practice.fromJson(Map<String, dynamic> json) {
    return Practice(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      form: json['form'],
      dueTime: json['due_Time'] != null
          ? DateTime.parse(json['due_Time'])
          : DateTime.now(),
      coordinator: json['coordinator'],
      students: List<int>.from(json['students']),
    );
  }
}

class Student {
  String email;
  String type;
  String username;
  List<Practice> practises;

  Student({
    required this.email,
    required this.type,
    required this.username,
    required this.practises,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    List<Practice> practises = [];
    if (json['practises'] != null) {
      var list = json['practises'] as List;
      practises = list.map((e) => Practice.fromJson(e)).toList();
    }
    return Student(
      email: json['email'],
      type: json['type'],
      username: json['username'],
      practises: practises,
    );
  }
}
