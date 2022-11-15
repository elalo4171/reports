import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reports/app/data/bloc/global_bloc.dart';
import 'package:reports/app/data/enums.dart';
import 'package:reports/app/data/model/report_model.dart';
import 'package:reports/app/data/provider/reports_local_db.dart';
import 'package:reports/app/widgets/appbar_home_widget.dart';
import 'package:reports/app/widgets/custom_divider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ReportsLocalDb reportsLocalDb = ReportsLocalDb();
    return BlocProvider(
      create: (context) => GlobalBloc(reportsLocalDb)..add(LoadReports()),
      child: const _BuildHomePage(),
    );
  }
}

class _BuildHomePage extends StatefulWidget {
  const _BuildHomePage();

  @override
  State<_BuildHomePage> createState() => _BuildHomePageState();
}

class _BuildHomePageState extends State<_BuildHomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const AppBarHomeWidget(),
                const _Title(),
                const SizedBox(height: 20),
                BlocBuilder<GlobalBloc, GlobalState>(
                  builder: (context, state) {
                    if (state.statusLoadReports ==
                        RequestStatus.submissionInProgress) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.statusLoadReports ==
                            RequestStatus.submissionSuccess &&
                        state.reports.isEmpty) {
                      return const Text('No reports yet');
                    }
                    List<ReportModel> reports = state.reports.reversed.toList();
                    return SizedBox(
                      height: 300,
                      child: ListView.separated(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: reports.length,
                          separatorBuilder: (context, index) =>
                              const CustomDivider(),
                          itemBuilder: (context, index) {
                            return _ReportListItem(
                              index: index,
                              scrollOffset: _scrollController.offset,
                              report: reports[index],
                            );
                          }),
                    );
                  },
                ),
                const Spacer(
                  flex: 4,
                ),
                const _BtnNewReport(),
                const Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BtnNewReport extends StatelessWidget {
  const _BtnNewReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final bloc = BlocProvider.of<GlobalBloc>(context);
        bloc.add(SetCurrentReport(const ReportModel()));
        bloc.add(SetIsEdit(true));
        await Navigator.of(context).pushNamed("new_report", arguments: bloc);
      },
      child: const Text('New Report',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Recent Reports",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}

class _ReportListItem extends StatelessWidget {
  const _ReportListItem({
    Key? key,
    required this.index,
    required this.scrollOffset,
    required this.report,
  }) : super(key: key);
  final int index;
  final double scrollOffset;
  final ReportModel report;

  @override
  Widget build(BuildContext context) {
    const itemHeight = 90.0;
    final itemPositionOffset = index * itemHeight + 20;
    final difference = scrollOffset - itemPositionOffset;
    final percent = 1 - (difference / itemHeight);
    double opacityPercent = percent;
    if (percent > 1) {
      opacityPercent = 1;
    } else if (percent < 0) {
      opacityPercent = 0;
    }
    return SizedBox(
      height: itemHeight,
      child: Opacity(
        opacity: opacityPercent,
        child: InkWell(
          onTap: () async {
            final bloc = BlocProvider.of<GlobalBloc>(context);
            bloc.add(SetCurrentReport(report));
            bloc.add(SetIsEdit(false));
            await Navigator.of(context)
                .pushNamed("new_report", arguments: bloc);
          },
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Center(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        report.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(report.date),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          report.description,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (report.hasImage()) const Icon(Icons.photo)
                    ],
                  ),
                ),
                // trailing: const Text("12/12/2021"),
                isThreeLine: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
