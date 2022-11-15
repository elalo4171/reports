import 'package:bloc/bloc.dart';
import 'package:reports/app/data/model/report_model.dart';
import 'package:reports/app/data/provider/reports_interface.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final ReportsInterface reportsLocalDb;
  GlobalBloc(this.reportsLocalDb) : super(const GlobalState()) {
    on<LoadLocalReports>((event, emit) {
      reportsLocalDb.getReports().then((reports) {
        emit(state.copyWith(reports: reports));
      });
    });
    on<CreatedReport>((event, emit) {
      reportsLocalDb.addReport(event.report).then((_) {
        reportsLocalDb.getReports().then((reports) {
          emit(state.copyWith(reports: reports));
        });
      });
    });
  }
}
