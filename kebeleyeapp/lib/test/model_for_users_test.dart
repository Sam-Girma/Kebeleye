class Course {
 int id;
 String code;
 String title;
 String description;
 int ects;

Course ({ required this.id, required this.code,required this.description, required this.ects,required this.title });

factory Course.fromJson(Map<String, dynamic> json) {
   return Course(
     id: json['id'],
     code: json['code'],
     title: json['title'],
     description: json['description'],
     ects: json['ects'],
   );
 }


}
