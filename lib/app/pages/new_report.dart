import 'package:flutter/material.dart';
import 'package:reports/app/widgets/custom_divider.dart';
import 'package:reports/config/colors_const.dart';

class NewReport extends StatelessWidget {
  const NewReport({super.key});

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
                    onTap: () {
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "The Title",
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
                  onChanged: (newValue) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
