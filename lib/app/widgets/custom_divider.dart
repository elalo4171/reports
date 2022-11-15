import 'package:flutter/material.dart';
import 'package:reports/config/colors_const.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: ColorsConst.textColor,
      thickness: 2,
      height: 0,
    );
  }
}
