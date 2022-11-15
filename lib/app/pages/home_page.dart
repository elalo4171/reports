import 'package:flutter/material.dart';
import 'package:reports/app/widgets/custom_divider.dart';
import 'package:reports/config/colors_const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("By Eduardo Garcia"),
                          ),
                        );
                      },
                      child: const Text("Report\nApp"),
                    ),
                    InkWell(
                        onTap: () {
                          //TODO Puesh to browser
                        },
                        child: const Icon(Icons.search)),
                  ],
                ),
                const Text(
                  "Recent Reports",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 40,
                      separatorBuilder: (context, index) =>
                          const CustomDivider(),
                      itemBuilder: (context, index) {
                        return _ReportListItem(
                          index: index,
                          scrollOffset: _scrollController.offset,
                        );
                      }),
                ),
                const Spacer(
                  flex: 4,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.of(context).pushNamed("new_report");
                  },
                  child: const Text('New Report',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const Spacer(),
                const Text('Or'),
                const Spacer(
                  flex: 2,
                ),
                InkWell(
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
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
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

class _ReportListItem extends StatelessWidget {
  const _ReportListItem({
    Key? key,
    required this.index,
    required this.scrollOffset,
  }) : super(key: key);
  final int index;
  final double scrollOffset;

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
                  const Text("Reporte 1"),
                  const Text("12/12/2021"),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Eduardo Garcia "),
                    const Icon(Icons.photo)
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