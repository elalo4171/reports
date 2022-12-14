import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reports/app/data/model/report_model.dart';
import 'package:reports/app/data/provider/reports_interface.dart';

class ReportsLocalDb implements ReportsInterface {
  final String _tableName = 'reports';

  static Future<void> initDataBase() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(documentDirectory.path);
  }

  @override
  Future<void> addReport(ReportModel report) async {
    var box = await Hive.openBox(_tableName);
    await box.put(report.id, jsonEncode(report.toJson()));
    await box.close();
  }

  @override
  Future<void> deleteReport(String id) async {
    var box = await Hive.openBox(_tableName);
    await box.delete(id);
    await box.close();
  }

  @override
  Future<List<ReportModel>> getReports() async {
    var box = await Hive.openBox(_tableName);
    var reports = box.values.map((e) {
      return ReportModel.fromJson(jsonDecode(e));
    });
    await box.close();
    return reports.toList();
  }

  @override
  Future<void> updateReport(ReportModel report) async {
    var box = await Hive.openBox(_tableName);
    await box.put(report.id, report.toJson());
    await box.close();
  }

  @override
  Future<ReportModel> getReport(String id) async {
    var box = await Hive.openBox(_tableName);
    var data = box.get(id);
    await box.close();
    return ReportModel.fromJson(data);
  }
}
