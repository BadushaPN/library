import 'package:flutter/material.dart';

import '../../utils/color.dart';

class MyBackground extends StatelessWidget {
  Widget? child;
  MyBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [dark, bright],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
