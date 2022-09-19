// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Record extends DataClass implements Insertable<Record> {
  final int id;
  final DateTime startTime;
  final DateTime? endTime;
  final DateTime? elaspedTime;
  Record(
      {required this.id,
      required this.startTime,
      this.endTime,
      this.elaspedTime});
  factory Record.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Record(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      startTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_time'])!,
      endTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_time']),
      elaspedTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}elasped_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['start_time'] = Variable<DateTime>(startTime);
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime?>(endTime);
    }
    if (!nullToAbsent || elaspedTime != null) {
      map['elasped_time'] = Variable<DateTime?>(elaspedTime);
    }
    return map;
  }

  RecordsCompanion toCompanion(bool nullToAbsent) {
    return RecordsCompanion(
      id: Value(id),
      startTime: Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      elaspedTime: elaspedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(elaspedTime),
    );
  }

  factory Record.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Record(
      id: serializer.fromJson<int>(json['id']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      elaspedTime: serializer.fromJson<DateTime?>(json['elaspedTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'elaspedTime': serializer.toJson<DateTime?>(elaspedTime),
    };
  }

  Record copyWith(
          {int? id,
          DateTime? startTime,
          DateTime? endTime,
          DateTime? elaspedTime}) =>
      Record(
        id: id ?? this.id,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        elaspedTime: elaspedTime ?? this.elaspedTime,
      );
  @override
  String toString() {
    return (StringBuffer('Record(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('elaspedTime: $elaspedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, startTime, endTime, elaspedTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Record &&
          other.id == this.id &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.elaspedTime == this.elaspedTime);
}

class RecordsCompanion extends UpdateCompanion<Record> {
  final Value<int> id;
  final Value<DateTime> startTime;
  final Value<DateTime?> endTime;
  final Value<DateTime?> elaspedTime;
  const RecordsCompanion({
    this.id = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.elaspedTime = const Value.absent(),
  });
  RecordsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime startTime,
    this.endTime = const Value.absent(),
    this.elaspedTime = const Value.absent(),
  }) : startTime = Value(startTime);
  static Insertable<Record> custom({
    Expression<int>? id,
    Expression<DateTime>? startTime,
    Expression<DateTime?>? endTime,
    Expression<DateTime?>? elaspedTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (elaspedTime != null) 'elasped_time': elaspedTime,
    });
  }

  RecordsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? startTime,
      Value<DateTime?>? endTime,
      Value<DateTime?>? elaspedTime}) {
    return RecordsCompanion(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      elaspedTime: elaspedTime ?? this.elaspedTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime?>(endTime.value);
    }
    if (elaspedTime.present) {
      map['elasped_time'] = Variable<DateTime?>(elaspedTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordsCompanion(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('elaspedTime: $elaspedTime')
          ..write(')'))
        .toString();
  }
}

class $RecordsTable extends Records with TableInfo<$RecordsTable, Record> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _startTimeMeta = const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime?> startTime = GeneratedColumn<DateTime?>(
      'start_time', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _endTimeMeta = const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime?> endTime = GeneratedColumn<DateTime?>(
      'end_time', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _elaspedTimeMeta =
      const VerificationMeta('elaspedTime');
  @override
  late final GeneratedColumn<DateTime?> elaspedTime =
      GeneratedColumn<DateTime?>('elasped_time', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, startTime, endTime, elaspedTime];
  @override
  String get aliasedName => _alias ?? 'records';
  @override
  String get actualTableName => 'records';
  @override
  VerificationContext validateIntegrity(Insertable<Record> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('elasped_time')) {
      context.handle(
          _elaspedTimeMeta,
          elaspedTime.isAcceptableOrUnknown(
              data['elasped_time']!, _elaspedTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Record map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Record.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RecordsTable createAlias(String alias) {
    return $RecordsTable(attachedDatabase, alias);
  }
}

class Movement extends DataClass implements Insertable<Movement> {
  final int id;
  final String lat;
  final String long;
  final String speed;
  final DateTime createAt;
  Movement(
      {required this.id,
      required this.lat,
      required this.long,
      required this.speed,
      required this.createAt});
  factory Movement.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Movement(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      lat: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}lat'])!,
      long: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}long'])!,
      speed: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}speed'])!,
      createAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lat'] = Variable<String>(lat);
    map['long'] = Variable<String>(long);
    map['speed'] = Variable<String>(speed);
    map['create_at'] = Variable<DateTime>(createAt);
    return map;
  }

  MovementsCompanion toCompanion(bool nullToAbsent) {
    return MovementsCompanion(
      id: Value(id),
      lat: Value(lat),
      long: Value(long),
      speed: Value(speed),
      createAt: Value(createAt),
    );
  }

  factory Movement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Movement(
      id: serializer.fromJson<int>(json['id']),
      lat: serializer.fromJson<String>(json['lat']),
      long: serializer.fromJson<String>(json['long']),
      speed: serializer.fromJson<String>(json['speed']),
      createAt: serializer.fromJson<DateTime>(json['createAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lat': serializer.toJson<String>(lat),
      'long': serializer.toJson<String>(long),
      'speed': serializer.toJson<String>(speed),
      'createAt': serializer.toJson<DateTime>(createAt),
    };
  }

  Movement copyWith(
          {int? id,
          String? lat,
          String? long,
          String? speed,
          DateTime? createAt}) =>
      Movement(
        id: id ?? this.id,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        speed: speed ?? this.speed,
        createAt: createAt ?? this.createAt,
      );
  @override
  String toString() {
    return (StringBuffer('Movement(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('speed: $speed, ')
          ..write('createAt: $createAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lat, long, speed, createAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movement &&
          other.id == this.id &&
          other.lat == this.lat &&
          other.long == this.long &&
          other.speed == this.speed &&
          other.createAt == this.createAt);
}

class MovementsCompanion extends UpdateCompanion<Movement> {
  final Value<int> id;
  final Value<String> lat;
  final Value<String> long;
  final Value<String> speed;
  final Value<DateTime> createAt;
  const MovementsCompanion({
    this.id = const Value.absent(),
    this.lat = const Value.absent(),
    this.long = const Value.absent(),
    this.speed = const Value.absent(),
    this.createAt = const Value.absent(),
  });
  MovementsCompanion.insert({
    required int id,
    required String lat,
    required String long,
    required String speed,
    this.createAt = const Value.absent(),
  })  : id = Value(id),
        lat = Value(lat),
        long = Value(long),
        speed = Value(speed);
  static Insertable<Movement> custom({
    Expression<int>? id,
    Expression<String>? lat,
    Expression<String>? long,
    Expression<String>? speed,
    Expression<DateTime>? createAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lat != null) 'lat': lat,
      if (long != null) 'long': long,
      if (speed != null) 'speed': speed,
      if (createAt != null) 'create_at': createAt,
    });
  }

  MovementsCompanion copyWith(
      {Value<int>? id,
      Value<String>? lat,
      Value<String>? long,
      Value<String>? speed,
      Value<DateTime>? createAt}) {
    return MovementsCompanion(
      id: id ?? this.id,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      speed: speed ?? this.speed,
      createAt: createAt ?? this.createAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lat.present) {
      map['lat'] = Variable<String>(lat.value);
    }
    if (long.present) {
      map['long'] = Variable<String>(long.value);
    }
    if (speed.present) {
      map['speed'] = Variable<String>(speed.value);
    }
    if (createAt.present) {
      map['create_at'] = Variable<DateTime>(createAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovementsCompanion(')
          ..write('id: $id, ')
          ..write('lat: $lat, ')
          ..write('long: $long, ')
          ..write('speed: $speed, ')
          ..write('createAt: $createAt')
          ..write(')'))
        .toString();
  }
}

class $MovementsTable extends Movements
    with TableInfo<$MovementsTable, Movement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovementsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<String?> lat = GeneratedColumn<String?>(
      'lat', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _longMeta = const VerificationMeta('long');
  @override
  late final GeneratedColumn<String?> long = GeneratedColumn<String?>(
      'long', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<String?> speed = GeneratedColumn<String?>(
      'speed', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _createAtMeta = const VerificationMeta('createAt');
  @override
  late final GeneratedColumn<DateTime?> createAt = GeneratedColumn<DateTime?>(
      'create_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [id, lat, long, speed, createAt];
  @override
  String get aliasedName => _alias ?? 'movements';
  @override
  String get actualTableName => 'movements';
  @override
  VerificationContext validateIntegrity(Insertable<Movement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('lat')) {
      context.handle(
          _latMeta, lat.isAcceptableOrUnknown(data['lat']!, _latMeta));
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('long')) {
      context.handle(
          _longMeta, long.isAcceptableOrUnknown(data['long']!, _longMeta));
    } else if (isInserting) {
      context.missing(_longMeta);
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    if (data.containsKey('create_at')) {
      context.handle(_createAtMeta,
          createAt.isAcceptableOrUnknown(data['create_at']!, _createAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Movement map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Movement.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MovementsTable createAlias(String alias) {
    return $MovementsTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $RecordsTable records = $RecordsTable(this);
  late final $MovementsTable movements = $MovementsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [records, movements];
}
