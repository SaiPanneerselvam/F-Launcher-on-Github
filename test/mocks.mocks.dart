// Mocks generated by Mockito 5.0.10 from annotations
// in flauncher/test/mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i10;

import 'package:flauncher/database.dart' as _i3;
import 'package:flauncher/flauncher_channel.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:moor/src/dsl/dsl.dart' as _i8;
import 'package:moor/src/runtime/api/runtime_api.dart' as _i4;
import 'package:moor/src/runtime/data_class.dart' as _i11;
import 'package:moor/src/runtime/executor/executor.dart' as _i6;
import 'package:moor/src/runtime/executor/stream_queries.dart' as _i7;
import 'package:moor/src/runtime/query_builder/query_builder.dart' as _i2;
import 'package:moor/src/runtime/types/sql_types.dart' as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeMigrationStrategy extends _i1.Fake implements _i2.MigrationStrategy {}

class _Fake$AppsTable extends _i1.Fake implements _i3.$AppsTable {}

class _Fake$CategoriesTable extends _i1.Fake implements _i3.$CategoriesTable {}

class _Fake$AppsCategoriesTable extends _i1.Fake implements _i3.$AppsCategoriesTable {}

class _FakeGeneratedDatabase extends _i1.Fake implements _i4.GeneratedDatabase {}

class _FakeStreamQueryUpdateRules extends _i1.Fake implements _i4.StreamQueryUpdateRules {}

class _FakeDatabaseConnection extends _i1.Fake implements _i4.DatabaseConnection {}

class _FakeSqlTypeSystem extends _i1.Fake implements _i5.SqlTypeSystem {}

class _FakeQueryExecutor extends _i1.Fake implements _i6.QueryExecutor {}

class _FakeStreamQueryStore extends _i1.Fake implements _i7.StreamQueryStore {}

class _FakeMigrator extends _i1.Fake implements _i2.Migrator {}

class _FakeInsertStatement<T extends _i8.Table, D> extends _i1.Fake implements _i2.InsertStatement<T, D> {}

class _FakeUpdateStatement<T extends _i8.Table, D> extends _i1.Fake implements _i2.UpdateStatement<T, D> {}

class _FakeSimpleSelectStatement<T extends _i8.Table, D> extends _i1.Fake implements _i2.SimpleSelectStatement<T, D> {}

class _FakeJoinedSelectStatement<FirstT extends _i8.Table, FirstD> extends _i1.Fake
    implements _i2.JoinedSelectStatement<FirstT, FirstD> {}

class _FakeDeleteStatement<T extends _i8.Table, D> extends _i1.Fake implements _i2.DeleteStatement<T, D> {}

class _FakeSelectable<T> extends _i1.Fake implements _i2.Selectable<T> {}

class _FakeGenerationContext extends _i1.Fake implements _i2.GenerationContext {}

/// A class which mocks [FLauncherChannel].
///
/// See the documentation for Mockito's code generation for more information.
class MockFLauncherChannel extends _i1.Mock implements _i9.FLauncherChannel {
  MockFLauncherChannel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<List<dynamic>> getInstalledApplications() =>
      (super.noSuchMethod(Invocation.method(#getInstalledApplications, []),
          returnValue: Future<List<dynamic>>.value(<dynamic>[])) as _i10.Future<List<dynamic>>);
  @override
  _i10.Future<void> launchApp(String? packageName, String? className) =>
      (super.noSuchMethod(Invocation.method(#launchApp, [packageName, className]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> openSettings() => (super.noSuchMethod(Invocation.method(#openSettings, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> openAppInfo(String? packageName) =>
      (super.noSuchMethod(Invocation.method(#openAppInfo, [packageName]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> uninstallApp(String? packageName) =>
      (super.noSuchMethod(Invocation.method(#uninstallApp, [packageName]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<bool> isDefaultLauncher() =>
      (super.noSuchMethod(Invocation.method(#isDefaultLauncher, []), returnValue: Future<bool>.value(false))
          as _i10.Future<bool>);
  @override
  void addAppsChangedListener(void Function(Map<dynamic, dynamic>)? listener) =>
      super.noSuchMethod(Invocation.method(#addAppsChangedListener, [listener]), returnValueForMissingStub: null);
}

/// A class which mocks [FLauncherDatabase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFLauncherDatabase extends _i1.Mock implements _i3.FLauncherDatabase {
  MockFLauncherDatabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get schemaVersion => (super.noSuchMethod(Invocation.getter(#schemaVersion), returnValue: 0) as int);
  @override
  _i2.MigrationStrategy get migration =>
      (super.noSuchMethod(Invocation.getter(#migration), returnValue: _FakeMigrationStrategy())
          as _i2.MigrationStrategy);
  @override
  _i3.$AppsTable get apps =>
      (super.noSuchMethod(Invocation.getter(#apps), returnValue: _Fake$AppsTable()) as _i3.$AppsTable);
  @override
  _i3.$CategoriesTable get categories =>
      (super.noSuchMethod(Invocation.getter(#categories), returnValue: _Fake$CategoriesTable())
          as _i3.$CategoriesTable);
  @override
  _i3.$AppsCategoriesTable get appsCategories =>
      (super.noSuchMethod(Invocation.getter(#appsCategories), returnValue: _Fake$AppsCategoriesTable())
          as _i3.$AppsCategoriesTable);
  @override
  Iterable<_i2.TableInfo<_i8.Table, dynamic>> get allTables =>
      (super.noSuchMethod(Invocation.getter(#allTables), returnValue: [])
          as Iterable<_i2.TableInfo<_i8.Table, dynamic>>);
  @override
  List<_i2.DatabaseSchemaEntity> get allSchemaEntities =>
      (super.noSuchMethod(Invocation.getter(#allSchemaEntities), returnValue: <_i2.DatabaseSchemaEntity>[])
          as List<_i2.DatabaseSchemaEntity>);
  @override
  _i4.GeneratedDatabase get attachedDatabase =>
      (super.noSuchMethod(Invocation.getter(#attachedDatabase), returnValue: _FakeGeneratedDatabase())
          as _i4.GeneratedDatabase);
  @override
  _i4.StreamQueryUpdateRules get streamUpdateRules =>
      (super.noSuchMethod(Invocation.getter(#streamUpdateRules), returnValue: _FakeStreamQueryUpdateRules())
          as _i4.StreamQueryUpdateRules);
  @override
  _i4.DatabaseConnection get connection =>
      (super.noSuchMethod(Invocation.getter(#connection), returnValue: _FakeDatabaseConnection())
          as _i4.DatabaseConnection);
  @override
  _i5.SqlTypeSystem get typeSystem =>
      (super.noSuchMethod(Invocation.getter(#typeSystem), returnValue: _FakeSqlTypeSystem()) as _i5.SqlTypeSystem);
  @override
  _i6.QueryExecutor get executor =>
      (super.noSuchMethod(Invocation.getter(#executor), returnValue: _FakeQueryExecutor()) as _i6.QueryExecutor);
  @override
  _i7.StreamQueryStore get streamQueries =>
      (super.noSuchMethod(Invocation.getter(#streamQueries), returnValue: _FakeStreamQueryStore())
          as _i7.StreamQueryStore);
  @override
  _i10.Future<List<_i3.App>> listApplications() => (super.noSuchMethod(Invocation.method(#listApplications, []),
      returnValue: Future<List<_i3.App>>.value(<_i3.App>[])) as _i10.Future<List<_i3.App>>);
  @override
  _i10.Future<void> persistApps(List<_i3.AppsCompanion>? applications) =>
      (super.noSuchMethod(Invocation.method(#persistApps, [applications]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> deleteApps(List<_i3.AppsCompanion>? applications) =>
      (super.noSuchMethod(Invocation.method(#deleteApps, [applications]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> insertCategory(_i3.CategoriesCompanion? category) =>
      (super.noSuchMethod(Invocation.method(#insertCategory, [category]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> deleteCategory(_i3.CategoriesCompanion? category) =>
      (super.noSuchMethod(Invocation.method(#deleteCategory, [category]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> persistCategories(List<_i3.CategoriesCompanion>? value) =>
      (super.noSuchMethod(Invocation.method(#persistCategories, [value]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> insertAppCategory(_i3.AppsCategoriesCompanion? appCategory) =>
      (super.noSuchMethod(Invocation.method(#insertAppCategory, [appCategory]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> deleteAppCategory(_i3.AppsCategoriesCompanion? appCategory) =>
      (super.noSuchMethod(Invocation.method(#deleteAppCategory, [appCategory]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> persistAppsCategories(List<_i3.AppsCategoriesCompanion>? value) =>
      (super.noSuchMethod(Invocation.method(#persistAppsCategories, [value]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<List<_i3.CategoryWithApps>> listCategoriesWithApps() =>
      (super.noSuchMethod(Invocation.method(#listCategoriesWithApps, []),
              returnValue: Future<List<_i3.CategoryWithApps>>.value(<_i3.CategoryWithApps>[]))
          as _i10.Future<List<_i3.CategoryWithApps>>);
  @override
  _i10.Future<int> nextAppCategoryOrder(_i3.CategoriesCompanion? category) =>
      (super.noSuchMethod(Invocation.method(#nextAppCategoryOrder, [category]), returnValue: Future<int>.value(0))
          as _i10.Future<int>);
  @override
  _i2.Migrator createMigrator() =>
      (super.noSuchMethod(Invocation.method(#createMigrator, []), returnValue: _FakeMigrator()) as _i2.Migrator);
  @override
  _i10.Future<void> beforeOpen(_i6.QueryExecutor? executor, _i2.OpeningDetails? details) =>
      (super.noSuchMethod(Invocation.method(#beforeOpen, [executor, details]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Stream<List<Map<String, Object?>>> createStream(_i7.QueryStreamFetcher? stmt) =>
      (super.noSuchMethod(Invocation.method(#createStream, [stmt]),
          returnValue: Stream<List<Map<String, Object?>>>.empty()) as _i10.Stream<List<Map<String, Object?>>>);
  @override
  T alias<T extends _i8.Table, D>(_i2.TableInfo<T, D>? table, String? alias) =>
      (super.noSuchMethod(Invocation.method(#alias, [table, alias]), returnValue: null) as T);
  @override
  void markTablesUpdated(Set<_i2.TableInfo<_i8.Table, dynamic>>? tables) =>
      super.noSuchMethod(Invocation.method(#markTablesUpdated, [tables]), returnValueForMissingStub: null);
  @override
  void notifyUpdates(Set<_i4.TableUpdate>? updates) =>
      super.noSuchMethod(Invocation.method(#notifyUpdates, [updates]), returnValueForMissingStub: null);
  @override
  _i10.Stream<Null?> tableUpdates([_i4.TableUpdateQuery? query = const _i4.TableUpdateQuery.any()]) =>
      (super.noSuchMethod(Invocation.method(#tableUpdates, [query]), returnValue: Stream<Null?>.empty())
          as _i10.Stream<Null?>);
  @override
  _i10.Future<T> doWhenOpened<T>(_i10.FutureOr<T>? Function(_i6.QueryExecutor)? fn) =>
      (super.noSuchMethod(Invocation.method(#doWhenOpened, [fn]), returnValue: Future<T>.value(null))
          as _i10.Future<T>);
  @override
  _i2.InsertStatement<T, D> into<T extends _i8.Table, D>(_i2.TableInfo<T, D>? table) =>
      (super.noSuchMethod(Invocation.method(#into, [table]), returnValue: _FakeInsertStatement<T, D>())
          as _i2.InsertStatement<T, D>);
  @override
  _i2.UpdateStatement<Tbl, R> update<Tbl extends _i8.Table, R>(_i2.TableInfo<Tbl, R>? table) =>
      (super.noSuchMethod(Invocation.method(#update, [table]), returnValue: _FakeUpdateStatement<Tbl, R>())
          as _i2.UpdateStatement<Tbl, R>);
  @override
  _i2.SimpleSelectStatement<T, R> select<T extends _i8.Table, R>(_i2.TableInfo<T, R>? table,
          {bool? distinct = false}) =>
      (super.noSuchMethod(Invocation.method(#select, [table], {#distinct: distinct}),
          returnValue: _FakeSimpleSelectStatement<T, R>()) as _i2.SimpleSelectStatement<T, R>);
  @override
  _i2.JoinedSelectStatement<T, R> selectOnly<T extends _i8.Table, R>(_i2.TableInfo<T, R>? table,
          {bool? distinct = false}) =>
      (super.noSuchMethod(Invocation.method(#selectOnly, [table], {#distinct: distinct}),
          returnValue: _FakeJoinedSelectStatement<T, R>()) as _i2.JoinedSelectStatement<T, R>);
  @override
  _i2.DeleteStatement<T, D> delete<T extends _i8.Table, D>(_i2.TableInfo<T, D>? table) =>
      (super.noSuchMethod(Invocation.method(#delete, [table]), returnValue: _FakeDeleteStatement<T, D>())
          as _i2.DeleteStatement<T, D>);
  @override
  _i10.Future<int> customUpdate(String? query,
          {List<_i2.Variable<dynamic>>? variables = const [],
          Set<_i2.TableInfo<_i8.Table, dynamic>>? updates,
          _i4.UpdateKind? updateKind}) =>
      (super.noSuchMethod(
          Invocation.method(
              #customUpdate, [query], {#variables: variables, #updates: updates, #updateKind: updateKind}),
          returnValue: Future<int>.value(0)) as _i10.Future<int>);
  @override
  _i10.Future<int> customInsert(String? query,
          {List<_i2.Variable<dynamic>>? variables = const [], Set<_i2.TableInfo<_i8.Table, dynamic>>? updates}) =>
      (super.noSuchMethod(Invocation.method(#customInsert, [query], {#variables: variables, #updates: updates}),
          returnValue: Future<int>.value(0)) as _i10.Future<int>);
  @override
  _i10.Future<List<_i2.QueryRow>> customWriteReturning(String? query,
          {List<_i2.Variable<dynamic>>? variables = const [],
          Set<_i2.TableInfo<_i8.Table, dynamic>>? updates,
          _i4.UpdateKind? updateKind}) =>
      (super.noSuchMethod(
          Invocation.method(
              #customWriteReturning, [query], {#variables: variables, #updates: updates, #updateKind: updateKind}),
          returnValue: Future<List<_i2.QueryRow>>.value(<_i2.QueryRow>[])) as _i10.Future<List<_i2.QueryRow>>);
  @override
  _i2.Selectable<_i2.QueryRow> customSelect(String? query,
          {List<_i2.Variable<dynamic>>? variables = const [],
          Set<_i2.TableInfo<_i8.Table, dynamic>>? readsFrom = const {}}) =>
      (super.noSuchMethod(Invocation.method(#customSelect, [query], {#variables: variables, #readsFrom: readsFrom}),
          returnValue: _FakeSelectable<_i2.QueryRow>()) as _i2.Selectable<_i2.QueryRow>);
  @override
  _i2.Selectable<_i2.QueryRow> customSelectQuery(String? query,
          {List<_i2.Variable<dynamic>>? variables = const [],
          Set<_i2.TableInfo<_i8.Table, dynamic>>? readsFrom = const {}}) =>
      (super.noSuchMethod(
          Invocation.method(#customSelectQuery, [query], {#variables: variables, #readsFrom: readsFrom}),
          returnValue: _FakeSelectable<_i2.QueryRow>()) as _i2.Selectable<_i2.QueryRow>);
  @override
  _i10.Future<void> customStatement(String? statement, [List<dynamic>? args]) =>
      (super.noSuchMethod(Invocation.method(#customStatement, [statement, args]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i10.Future<T> transaction<T>(_i10.Future<T> Function()? action) =>
      (super.noSuchMethod(Invocation.method(#transaction, [action]), returnValue: Future<T>.value(null))
          as _i10.Future<T>);
  @override
  _i10.Future<void> batch(dynamic Function(_i4.Batch)? runInBatch) =>
      (super.noSuchMethod(Invocation.method(#batch, [runInBatch]),
          returnValue: Future<void>.value(), returnValueForMissingStub: Future.value()) as _i10.Future<void>);
  @override
  _i2.GenerationContext $write(_i2.Component? component, {bool? hasMultipleTables}) =>
      (super.noSuchMethod(Invocation.method(#$write, [component], {#hasMultipleTables: hasMultipleTables}),
          returnValue: _FakeGenerationContext()) as _i2.GenerationContext);
  @override
  _i2.GenerationContext $writeInsertable(
          _i2.TableInfo<_i8.Table, dynamic>? table, _i11.Insertable<dynamic>? insertable) =>
      (super.noSuchMethod(Invocation.method(#$writeInsertable, [table, insertable]),
          returnValue: _FakeGenerationContext()) as _i2.GenerationContext);
}
