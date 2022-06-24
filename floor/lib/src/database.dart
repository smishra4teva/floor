import 'dart:async';

import 'package:meta/meta.dart';
import 'package:sqflite_common/sqlite_api.dart' as sqlite_api;

/// Extend this class to enable database functionality.
abstract class FloorDatabase {
  /// [StreamController] that is responsible for notifying listeners about changes
  /// in specific tables. It acts as an event bus.
  @protected
  late final StreamController<String> changeListener;

  /// Use this whenever you need direct access to the sqflite database.
  late final sqlite_api.DatabaseExecutor database;

  /// Closes the database.
  Future<void> close() async {
    await changeListener.close();

    final database = this.database;
    if (database is sqlite_api.Database && database.isOpen) {
      await database.close();
    }
  }
}
