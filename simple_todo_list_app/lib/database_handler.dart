import 'package:path/path.dart';
import 'package:simple_todo_list_app/savelist.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHandler{

  Future<Database> initializeDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'todolist.db'),
      onCreate: (db, version) async{
        await db.execute (
          "create table todolists (id integer primary key autoincrement, title text, date text)"
        );
      },
      version: 1,
    );
  }

  Future<List<SaveList>> queryTodoList() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> query =
    await db.rawQuery('select * from todolists');
    return query.map((e) => SaveList.fromMap(e)).toList();
  }

  Future<int> insertlist (SaveList savelist) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into todolists(title, date) values (?,?)',
      [savelist.title, savelist.date]
    );
    return result;
  }
}