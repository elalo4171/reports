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
        id: (state.reports.length + 1).toString(),
      );
      emit(state.copyWith(
          statusLoadReports: RequestStatus.submissionInProgress));
      await reportsLocalDb.addReport(report);
      emit(state.copyWith(statusLoadReports: RequestStatus.submissionSuccess));
      add(LoadReports());
    });
  }
}
