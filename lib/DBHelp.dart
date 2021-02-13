import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:project_moonhwadiary/name.dart';


final String tableName = 'diaries';


class DBHelper {

  DBHelper._();
  static final DBHelper _db = DBHelper._();
  factory DBHelper() => _db;

  static Database _database;

  Future<Database> get database async {
    if(_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'MoonhwadiaryDB.db');

    return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('CREATE TABLE $tableName(_no integer PRIMARY KEY AUTOINCREMENT, datetime TEXT, title TEXT, contents TEXT, feel integer,id TEXT, pic TEXT)');
        },
        onUpgrade: (db, oldVersion, newVersion){}
    );
  }


  Future<void> insertDiary(Diary diary) async {
    final db = await database;

    var res = await db.insert(
      tableName,
      diary.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print("insertDiary : " + res.toString());

  }



  Future<void> updateDiary(Diary diary) async {
    final db = await database;

    // 주어진 Diary를 수정합니다.
    var res = await db.update(
      tableName,
      diary.toMap(),
      // Diary의 dateTime가 일치하는 지 확인합니다.
      where: "_no = ?",
      // Diary의 dateTime를 whereArg로 넘겨 SQL injection을 방지합니다.
      whereArgs: [diary.no], //
    );

    print("updateDiary : " + res.toString());

  }


  Future<void> deleteDiary(int no) async {
    final db = await database;

    // 데이터베이스에서 Diary를 삭제합니다.
    var res = await db.delete(
      tableName,
      // 특정 diary를 제거하기 위해 `where` 절을 사용하세요
      where: "_no = ?",
      // Diary의 dateTime를 where의 인자로 넘겨 SQL injection을 방지합니다.
      whereArgs: [no],
    );

    print("deleteDiary : " + res.toString());
  }

  Future<List<Diary>> selectDiary(int no) async {
    final db = await database;

    // 모든 Diary를 얻기 위해 테이블에 질의합니다.
    final List<Map<String, dynamic>> maps =
    await db.query('diaries', where: 'no = ?', whereArgs: [no]);

    print("selectDiary : "+ maps.toString());

    // List<Map<String, dynamic>를 List<Diary>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return Diary(
        title: maps[i]['title'],
        contents: maps[i]['contents'] ,
        dateTime: maps[i]['datetime'],
        feel: maps[i]['feel'],
        id: maps[i]['id'],
        pic : maps[i]['pic'],
      );
    });
  }


  Future<List<Diary>> selectAllDiary() async {
    final db = await database;

    // 월별 검색
    //final List<Map<String, dynamic>> maps = await db.query('diaries', where:"strftime('%m', datetime) = '01'");

    // 전체 검색
    final List<Map<String, dynamic>> maps = await db.query('diaries');

    print("selecAlltDiary : "+ maps.toString());

    // List<Map<String, dynamic>를 List<diary>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return Diary(
        title: maps[i]['title'],
        contents: maps[i]['contents'],
        dateTime: maps[i]['datetime'],
        feel: maps[i]['feel'],
      );
    });
  }
}
