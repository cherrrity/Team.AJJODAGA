import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:project_moonhwadiary/name.dart';
final String tableName = 'diarys';

class DBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(
        join(await getDatabasesPath(), 'diary.db'),

        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE tasks(생성할 열 이름 자료형)',
          );
        },
        version: 1);
    return _db;
  }
  Future<void> insertDiary(Diary diary) async {
    final db = await database;

    await db.insert(
      tableName,
      diary.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<List<Diary>> memos() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('diarys');

    // List<Map<String, dynamic>를 List<Memo>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return Diary(
        year: maps[i]['year'],
        month: maps[i]['month'],
        day: maps[i]['day'],
        feel: maps[i]['feel'],
      );
    });
  }


  Future<void> updateDiary(Diary diary) async {
    final db = await database;

    // 주어진 Memo를 수정합니다.
    await db.update(
      tableName,
      diary.toMap(),
      // Memo의 id가 일치하는 지 확인합니다.
      where: "day = ?",
      // Memo의 id를 whereArg로 넘겨 SQL injection을 방지합니다.
      whereArgs: [diary.day],
    );
  }

  Future<void> deleteDiary(String day) async {
    final db = await database;

    // 데이터베이스에서 Memo를 삭제합니다.
    await db.delete(
      tableName,
      // 특정 memo를 제거하기 위해 `where` 절을 사용하세요
      where: "day = ?",
      // Memo의 id를 where의 인자로 넘겨 SQL injection을 방지합니다.
      whereArgs: [day],
    );
  }

  Future<List<Diary>> findDiary(String day) async {
    final db = await database;

    // 모든 Memo를 얻기 위해 테이블에 질의합니다.
    final List<Map<String, dynamic>> maps =
    await db.query('diarys', where: 'day = ?', whereArgs: [day]);

    // List<Map<String, dynamic>를 List<Memo>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return Diary(
        year: maps[i]['year'],
        month: maps[i]['month'],
        day: maps[i]['day'],
        feel: maps[i]['feel'],
      );
    });
  }


}
