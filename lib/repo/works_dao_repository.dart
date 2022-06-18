import 'package:to_do_application/entity/works.dart';
import 'package:to_do_application/sqlite/database_helper.dart';

class WorksDaoRepository {
  Future<void> saveWork(String work_name) async {
    var db = await DatabaseHelper.connectDb();
    var infos = Map<String, dynamic>();
    infos["work_name"] = work_name;
    await db.insert("works", infos);
  }

  Future<void> updateWork(int work_id, String work_name) async {
    var db = await DatabaseHelper.connectDb();
    var infos = Map<String, dynamic>();
    infos["work_name"] = work_name;

    await db.update("works", infos, where: "work_id = ?", whereArgs: [work_id]);
  }

  Future<List<Works>> showWorks() async {
    var db = await DatabaseHelper.connectDb();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM works");

    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Works(work_id: row["work_id"], work_name: row["work_name"]);
    });
  }

  Future<List<Works>> makeSearch(String searchingWord) async {
    var db = await DatabaseHelper.connectDb();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM works WHERE work_name like '%$searchingWord%'");

    return List.generate(maps.length, (i) {
      var row = maps[i];
      return Works(work_id: row["work_id"], work_name: row["work_name"]);
    });
  }

  Future<void> deleteWork(int work_id) async {
    var db = await DatabaseHelper.connectDb();

    await db.delete("works", where: "work_id = ?", whereArgs: [work_id]);
  }
}
