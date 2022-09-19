import 'package:drift/drift.dart';

class Records extends Table {
  // PRIMARY KEY
  // 'asdff', 2021-1-2, 12, 14, 1, 2021-3-5
  IntColumn get id => integer().autoIncrement()();

  // 일정 날짜
  // 생성 날짜 , 시작 날짜 같음
  DateTimeColumn get startTime => dateTime()();

  // 종료 시간
  DateTimeColumn get endTime => dateTime().nullable()();

  // 경과 시간
  DateTimeColumn get elaspedTime => dateTime().nullable()();

  // IntColumn get movement => integer()();
}
