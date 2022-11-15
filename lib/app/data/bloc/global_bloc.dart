import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:reports/app/data/enums.dart';
import 'package:reports/app/data/model/report_model.dart';
import 'package:reports/app/data/provider/reports_interface.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final ReportsInterface reportsLocalDb;
  GlobalBloc(this.reportsLocalDb) : super(const GlobalState()) {
    on<LoadReports>((event, emit) async {
      emit(state.copyWith(
          statusLoadReports: RequestStatus.submissionInProgress));
      await reportsLocalDb.getReports().then((reports) {
        emit(state.copyWith(reports: reports));
      });
      emit(state.copyWith(statusLoadReports: RequestStatus.submissionSuccess));
    });
    on<CreatedReport>((event, emit) async {
      ReportModel report = event.report;
      final f = DateFormat('yyyy-MM-dd');
      report = report.copyWith(
        date: f.format(DateTime.now()),
        id: report.id.isEmpty
            ? (state.reports.length + 1).toString()
            : report.id,
      );
      emit(state.copyWith(
          statusLoadReports: RequestStatus.submissionInProgress));
      await reportsLocalDb.addReport(report);
      emit(state.copyWith(statusLoadReports: RequestStatus.submissionSuccess));
      add(LoadReports());
    });
    on<SetCurrentReport>((event, emit) async {
      emit(state.copyWith(currentReport: event.report));
    });
    on<SetIsEdit>((event, emit) async {
      emit(state.copyWith(isEdit: event.isEdit));
    });
    on<UpdatedReport>((event, emit) async {
      ReportModel report = event.report;
      final f = DateFormat('yyyy-MM-dd');
      report = report.copyWith(
        date: f.format(DateTime.now()),
        id: report.id,
      );
      emit(state.copyWith(
          statusLoadReports: RequestStatus.submissionInProgress));
      await reportsLocalDb.updateReport(report);
      emit(state.copyWith(statusLoadReports: RequestStatus.submissionSuccess));
      add(LoadReports());
    });
    on<DeletedReport>((event, emit) async {
      ReportModel report = event.report;
      emit(state.copyWith(
          statusLoadReports: RequestStatus.submissionInProgress));
      await reportsLocalDb.deleteReport(report.id);
      emit(state.copyWith(statusLoadReports: RequestStatus.submissionSuccess));
      add(LoadReports());
    });
  }
}
