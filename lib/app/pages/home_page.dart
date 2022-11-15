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
  ScrollController _scrollController = ScrollController();

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
                    return SizedBox(
                      height: 300,
                      child: ListView.separated(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.reports.length,
                          separatorBuilder: (context, index) =>
                              const CustomDivider(),
                          itemBuilder: (context, index) {
                            return _ReportListItem(
                              index: index,
                              scrollOffset: _scrollController.offset,
                              report: state.reports[index],
                            );
                          }),
                    );
                  },
                ),
                const Spacer(
                  flex: 4,
                ),
                const _BtnNewReport(),
                const Spacer(),
                const Text('Or'),
                const Spacer(
                  flex: 2,
                ),
                const _BtnBrowseReports(),
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

class _BtnBrowseReports extends StatelessWidget {
  const _BtnBrowseReports({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("By Eduardo Garcia"),
          ),
        );
      },
      child: const Text(
        'Browse Reports',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
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
        await Navigator.of(context).pushNamed("new_report",
            arguments: BlocProvider.of<GlobalBloc>(context));
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
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          child: Center(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(report.title),
                  Text(report.date),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(report.description),
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
    );
  }
}
