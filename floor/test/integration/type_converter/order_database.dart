import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite_common/sqlite_api.dart' as sqlite_api;

import 'order.dart';
import 'order_dao.dart';
import 'type_converter.dart';

part 'order_database.g.dart';

@Database(version: 1, entities: [Order])
@TypeConverters([DateTimeConverter])
abstract class OrderDatabase extends FloorDatabase {
  OrderDao get orderDao;
}
