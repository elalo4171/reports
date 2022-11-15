import 'package:flutter/material.dart';
import 'package:reports/app/data/model/report_model.dart';
import 'package:reports/app/data/provider/reports_local_db.dart';
import 'package:reports/app/widgets/custom_divider.dart';

class NewReport extends StatefulWidget {
  const NewReport({super.key});

  @override
  State<NewReport> createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  ReportModel _reportModel = ReportModel();

  Future<void> saveReport() async {
    ReportsLocalDb db = ReportsLocalDb();
    await db.addReport(_reportModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await saveReport();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Save",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Text(
                    'Add',
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            const CustomDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: TextField(
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: "The Title",
                  ),
                  onChanged: (value) => _reportModel = _reportModel.copyWith(
                    title: value,
                  ),
                ),
              ),
            ),
            const CustomDivider(),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  maxLines: null,
                  autocorrect: true,
                  decoration: const InputDecoration(
                    hintText: "Your report",
                  ),
                  onChanged: (value) => _reportModel.copyWith(
                    description: value,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
