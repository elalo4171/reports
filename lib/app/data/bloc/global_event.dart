part of 'global_bloc.dart';

abstract class GlobalEvent {}

class LoadLocalReports extends GlobalEvent {}

class CreatedReport extends GlobalEvent {
  final ReportModel report;
  CreatedReport(this.report);
}
