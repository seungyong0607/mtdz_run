import 'package:drift/drift.dart';

class Movements extends Table {
  // PRIMARY KEY
  // '1', 37.523327, 126.921252, 2.5, 2021-3-5 06:00:00
  IntColumn get id => integer()();

  TextColumn get lat => text()();
  TextColumn get long => text()();
  TextColumn get speed => text()();

  // 생성날짜 /자동
  DateTimeColumn get createAt => dateTime().clientDefault(
        () => DateTime.now(),
      )();
}
