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
      dueTime: DateTime.parse(json['due_Time']),
      coordinator: json['coordinator'],
      students: List<int>.from(json['students']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['form'] = this.form;
    data['due_Time'] = this.dueTime.toIso8601String();
    data['coordinator'] = this.coordinator;
    data['students'] = this.students;
    return data;
  }
}
