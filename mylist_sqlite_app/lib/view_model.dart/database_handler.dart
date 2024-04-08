import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/model/rest_list.dart';

class DatabaseHandler{

  Future<Database> initializeDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'student.db'),
      onCreate: (db, version) async{
        await db.execute (
          //   시퀀스 , 가게이름, 가게번호, 위도, 경도, 이미지, 평가, 입력일
          "create table favoritelist (seq integer primary key autoincrement, name text, phone text, lat text, lng text, image blob, estimate text, initdate text)"
        );
      },
      version: 1,
    );
  }

  Future<List<RestList>> queryList() async{
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResults = 
      await db.rawQuery('select * from favoritelist');
    return queryResults.map((e) => RestList.fromMap(e)).toList();
  }


  Future<int> insertList(RestList restList) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.rawInsert(
      'insert into favoritelist(seq, name, phone, lat, lng, image, estimate, initdate) values (?,?,?,?,?,?,?,?)',
      [restList.seq, restList.name, restList.phone, restList.lat
      , restList.lng, restList.image, restList.estimate, restList.initdate]
    );
    return result;
  }
  }