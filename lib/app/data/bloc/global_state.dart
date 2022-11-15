part of 'global_bloc.dart';

class GlobalState {
  final List<ReportModel> reports;
  final ReportModel currentReport;
  final RequestStatus statusLoadReports;

  const GlobalState({
    this.reports = const [],
    this.currentReport = const ReportModel(),
    this.statusLoadReports = RequestStatus.pure,
  });

  GlobalState copyWith({
    List<ReportModel>? reports,
    ReportModel? currentReport,
    RequestStatus? statusLoadReports,
  }) {
    return GlobalState(
      reports: reports ?? this.reports,
      currentReport: currentReport ?? this.currentReport,
      statusLoadReports: statusLoadReports ?? this.statusLoadReports,
    );
  }
}
