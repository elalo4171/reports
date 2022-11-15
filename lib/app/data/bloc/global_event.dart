part of 'global_bloc.dart';

abstract class GlobalEvent {}

class LoadReports extends GlobalEvent {}

class CreatedReport extends GlobalEvent {
  final ReportModel report;
  CreatedReport(this.report);
}
