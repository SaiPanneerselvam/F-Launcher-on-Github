/*
 * FLauncher
 * Copyright (C) 2021  Étienne Fesser
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flauncher/database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart' hide isNull;

void main() {
  late FLauncherDatabase database;
  setUp(() {
    database = FLauncherDatabase(() => VmDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  test("listApplications", () async {
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher', 'FLauncher', '.MainActivity', '1.0.0', null, null);");

    final apps = await database.listApplications();

    expect(apps.length, 1);
    expect(apps[0].packageName, "me.efesser.flauncher");
    expect(apps[0].name, "FLauncher");
    expect(apps[0].className, ".MainActivity");
    expect(apps[0].version, "1.0.0");
    expect(apps[0].banner, null);
    expect(apps[0].icon, null);
  });

  test("persistApps", () async {
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher', 'FLauncher', '.MainActivity', '1.0.0', null, null);");
    await database.persistApps([
      AppsCompanion.insert(
          packageName: "me.efesser.flauncher", name: "FLauncher 2", className: ".MainActivity", version: "1.1.0")
    ]);

    final app = await database.customSelect("SELECT * FROM apps;").getSingle();
    expect(app.read<String>("package_name"), "me.efesser.flauncher");
    expect(app.read<String>("name"), "FLauncher 2");
    expect(app.read<String>("class_name"), ".MainActivity");
    expect(app.read<String>("version"), "1.1.0");
    expect(app.read<Uint8List?>("banner"), null);
    expect(app.read<Uint8List?>("icon"), null);
  });

  test("deleteApps", () async {
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher', 'FLauncher', '.MainActivity', '1.0.0', null, null);");
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher.2', 'FLauncher 2', '.MainActivity', '1.0.0', null, null);");

    await database.deleteApps([AppsCompanion(packageName: Value("me.efesser.flauncher"))]);

    final app = await database.customSelect("SELECT * FROM apps;").getSingle();
    expect(app.read<String>("package_name"), "me.efesser.flauncher.2");
  });

  test("insertCategory", () async {
    await database.insertCategory(CategoriesCompanion.insert(name: "Test", order: 2));

    final category = await database.customSelect("SELECT * FROM categories WHERE name = 'Test';").getSingle();
    expect(category.read<String>("name"), "Test");
    expect(category.read<int>("order"), 2);
  });

  test("deleteCategory", () async {
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher', 'FLauncher', '.MainActivity', '1.0.0', null, null);");
    await database.customInsert("INSERT INTO categories(name, 'order')"
        " VALUES('Test', 2);");
    await database.customInsert("INSERT INTO apps_categories(category_name, app_package_name, 'order')"
        " VALUES('Test', 'me.efesser.flauncher', 0);");

    await database.deleteCategory(CategoriesCompanion(name: Value("Test")));

    final app = await database.customSelect("SELECT * FROM apps;").getSingle();
    expect(app.read<String>("package_name"), "me.efesser.flauncher");
    final appsCategories = await database.customSelect("SELECT * FROM apps_categories;").get();
    expect(appsCategories.length, 0);
    final categories = await database.customSelect("SELECT * FROM categories c ORDER BY c.'order' ASC;").get();
    expect(categories.length, 2);
    expect(categories[0].read<String>("name"), "Favorites");
    expect(categories[1].read<String>("name"), "Applications");
  });

  test("persistCategories", () async {
    await database.customInsert("INSERT INTO categories(name, 'order')"
        " VALUES('Test 1', 2);");
    await database.customInsert("INSERT INTO categories(name, 'order')"
        " VALUES('Test 2', 3);");

    await database.persistCategories(
        [CategoriesCompanion.insert(name: "Test 2", order: 2), CategoriesCompanion.insert(name: "Test 1", order: 3)]);

    final categories = await database.customSelect("SELECT * FROM categories c ORDER BY c.'order' ASC;").get();
    expect(categories.length, 4);
    expect(categories[0].read<String>("name"), "Favorites");
    expect(categories[1].read<String>("name"), "Applications");
    expect(categories[2].read<String>("name"), "Test 2");
    expect(categories[3].read<String>("name"), "Test 1");
  });

  test("insertAppCategory", () async {
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher', 'FLauncher', '.MainActivity', '1.0.0', null, null);");
    await database.customInsert("INSERT INTO categories(name, 'order')"
        " VALUES('Test', 2);");
    await database.insertAppCategory(
        AppsCategoriesCompanion.insert(categoryName: "Test", appPackageName: "me.efesser.flauncher", order: 0));

    final appCategory = await database.customSelect("SELECT * FROM apps_categories;").getSingle();
    expect(appCategory.read<String>("category_name"), "Test");
    expect(appCategory.read<String>("app_package_name"), "me.efesser.flauncher");
    expect(appCategory.read<int>("order"), 0);
  });

  test("deleteAppCategory", () async {
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher', 'FLauncher', '.MainActivity', '1.0.0', null, null);");
    await database.customInsert("INSERT INTO categories(name, 'order')"
        " VALUES('Test', 2);");
    await database.customInsert("INSERT INTO apps_categories(category_name, app_package_name, 'order')"
        " VALUES('Test', 'me.efesser.flauncher', 0);");

    await database.deleteAppCategory(
        AppsCategoriesCompanion(categoryName: Value("Test"), appPackageName: Value("me.efesser.flauncher")));

    final app = await database.customSelect("SELECT * FROM apps;").getSingle();
    expect(app.read<String>("package_name"), "me.efesser.flauncher");
    final appsCategories = await database.customSelect("SELECT * FROM apps_categories;").get();
    expect(appsCategories.length, 0);
    final categories = await database.customSelect("SELECT * FROM categories c ORDER BY c.'order' ASC;").get();
    expect(categories.length, 3);
    expect(categories[0].read<String>("name"), "Favorites");
    expect(categories[1].read<String>("name"), "Applications");
    expect(categories[2].read<String>("name"), "Test");
  });

  test("persistAppsCategories", () async {
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher', 'FLauncher', '.MainActivity', '1.0.0', null, null);");
    await database.customInsert("INSERT INTO categories(name, 'order')"
        " VALUES('Test', 2);");
    await database.customInsert("INSERT INTO apps_categories(category_name, app_package_name, 'order')"
        " VALUES('Test', 'me.efesser.flauncher', 0);");

    await database.persistAppsCategories(
        [AppsCategoriesCompanion.insert(categoryName: "Test", appPackageName: "me.efesser.flauncher", order: 1)]);

    final appCategory = await database.customSelect("SELECT * FROM apps_categories;").getSingle();
    expect(appCategory.read<String>("category_name"), "Test");
    expect(appCategory.read<String>("app_package_name"), "me.efesser.flauncher");
    expect(appCategory.read<int>("order"), 1);
  });

  test("listCategoriesWithApps", () async {
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher', 'FLauncher', '.MainActivity', '1.0.0', null, null);");
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher.2', 'FLauncher 2', '.MainActivity', '1.0.0', null, null);");
    await database.customInsert("INSERT INTO categories(name, 'order')"
        " VALUES('Test', 2);");
    await database.customInsert("INSERT INTO apps_categories(category_name, app_package_name, 'order')"
        " VALUES('Test', 'me.efesser.flauncher', 1);");
    await database.customInsert("INSERT INTO apps_categories(category_name, app_package_name, 'order')"
        " VALUES('Test', 'me.efesser.flauncher.2', 0);");

    final categoriesWithApps = await database.listCategoriesWithApps();

    expect(categoriesWithApps.length, 3);
    expect(categoriesWithApps[0].category.name, "Favorites");
    expect(categoriesWithApps[1].category.name, "Applications");
    expect(categoriesWithApps[2].category.name, "Test");
    expect(categoriesWithApps[0].applications.length, 0);
    expect(categoriesWithApps[1].applications.length, 0);
    expect(categoriesWithApps[2].applications.length, 2);
    expect(categoriesWithApps[2].applications[0].packageName, "me.efesser.flauncher.2");
    expect(categoriesWithApps[2].applications[0].name, "FLauncher 2");
    expect(categoriesWithApps[2].applications[1].packageName, "me.efesser.flauncher");
    expect(categoriesWithApps[2].applications[1].name, "FLauncher");
  });

  test("nextAppCategoryOrder", () async {
    await database.customInsert("INSERT INTO apps(package_name, name, class_name, version, banner, icon)"
        " VALUES('me.efesser.flauncher', 'FLauncher', '.MainActivity', '1.0.0', null, null);");
    await database.customInsert("INSERT INTO categories(name, 'order')"
        " VALUES('Test', 2);");
    await database.customInsert("INSERT INTO apps_categories(category_name, app_package_name, 'order')"
        " VALUES('Test', 'me.efesser.flauncher', 1);");

    final index = await database.nextAppCategoryOrder(CategoriesCompanion(name: Value("Test")));

    expect(index, 2);
  });
}