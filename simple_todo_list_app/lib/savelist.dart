class SaveList {
  int? id;
  String title;
  String date;

  SaveList({this.id, required this.title, required this.date});

  SaveList.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        date = res['date'];
}
