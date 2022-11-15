part of 'global_bloc.dart';

abstract class GlobalEvent {}

class LoadReports extends GlobalEvent {}

class CreatedReport extends GlobalEvent {
  final ReportModel report;
  CreatedReport(this.report);
}

class SetCurrentReport extends GlobalEvent {
  final ReportModel report;
  SetCurrentReport(this.report);
}

class SetIsEdit extends GlobalEvent {
  final bool isEdit;
  SetIsEdit(this.isEdit);
}

class UpdatedReport extends GlobalEvent {
  final ReportModel report;
  UpdatedReport(this.report);
}

class DeletedReport extends GlobalEvent {
  final ReportModel report;
  DeletedReport(this.report);
}
