part of 'global_bloc.dart';

@immutable
class GlobalState {
  final List<ReportModel> reports;
  final ReportModel currentReport;

  const GlobalState({
    this.reports = const [],
    this.currentReport = const ReportModel(),
  });

  GlobalState copyWith({
    List<ReportModel>? reports,
    ReportModel? currentReport,
  }) {
    return GlobalState(
      reports: reports ?? this.reports,
      currentReport: currentReport ?? this.currentReport,
    );
  }
}
