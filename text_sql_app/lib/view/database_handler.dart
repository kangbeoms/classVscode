import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:text_sql_app/model/students.dart';


class DatabaseHandler{

  Future<Database> initializeDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'student.db'),
      onCreate: (db, version) async{
        await db.execute (
          "create table students (id integer primary key autoincrement, code text, name text, dept text, phone text, image blob)"
        );
      },
      version: 1,
    );
  }

  Future<List<Students>> queryStudents() async{
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResults = 
      await db.rawQuery('select * from students');
    return queryResults.map((e) => Students.fromMap(e)).toList();
  }

  Future<int> insertStudents(Students student) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into students(code, name, dept, phone, image) values (?,?,?,?,?)',
      [student.code, student.name, student.dept, student.phone, student.image]
    );
    return result;
  }

  Future<void> updateStudents(Students student) async {
    final Database db = await initializeDB();
    await db.rawUpdate(
      'update students set name=?, dept=?, phone=?, image=? where code=?',
      [student.name, student.dept, student.phone,student.image, student.code]
    );
  }

  Future<void> deleteStudents(int id) async {
    final Database db = await initializeDB();
    await db.rawDelete(
      'DELETE FROM students WHERE id=?',
      [id]
    );
  }


}