import 'package:flutter/material.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
