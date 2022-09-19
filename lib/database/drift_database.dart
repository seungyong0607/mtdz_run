import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import 'package:mtdz_run/model/Movements.dart';
import 'package:mtdz_run/model/Records.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

@DriftDatabase(tables: [
  Records,
  Movements,
])
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<int> createRecord(RecordsCompanion data) => into(records).insert(data);

  Future<List<Record>> getRecord() => select(records).get();
  Future<List<Movement>> getMovements() {
    final query = select(movements).get();
    return query;
  }

  Future<List<Movement>> getMovementsById(int id) =>
      (select(movements)..where((tbl) => tbl.id.equals(id))).get();

  Future<int> updateRecord(MovementsCompanion data) =>
      into(movements).insert(data);

  // Future<int> updateRecordByuId(int id, MovementsCompanion data) =>
  //     (into(movements)..where((tbl) => tbl.id.equals(id))).write(data);

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
