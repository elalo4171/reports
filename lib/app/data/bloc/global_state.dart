part of 'global_bloc.dart';

class GlobalState {
  final List<ReportModel> reports;
  final ReportModel currentReport;
  final RequestStatus statusLoadReports;
  final bool isEdit;

  const GlobalState({
    this.reports = const [],
    this.currentReport = const ReportModel(),
    this.statusLoadReports = RequestStatus.pure,
    this.isEdit = false,
  });

  GlobalState copyWith({
    List<ReportModel>? reports,
    ReportModel? currentReport,
    RequestStatus? statusLoadReports,
    bool? isEdit,
  }) {
    return GlobalState(
      reports: reports ?? this.reports,
      currentReport: currentReport ?? this.currentReport,
      statusLoadReports: statusLoadReports ?? this.statusLoadReports,
      isEdit: isEdit ?? this.isEdit,
    );
  }
}
