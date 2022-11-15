import 'package:reports/app/data/model/report_model.dart';

abstract class ReportsInterface {
  Future<List<ReportModel>> getReports();
  Future<void> addReport(ReportModel report);
  Future<void> deleteReport(String report);
  Future<void> updateReport(ReportModel report);
  Future<ReportModel> getReport(String id);
}
