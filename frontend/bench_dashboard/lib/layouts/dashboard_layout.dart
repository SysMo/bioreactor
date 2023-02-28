import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final double tileWidth;
  final double tileHegiht;
  final List<Widget> children;

  const DashboardLayout({
    super.key,
    required this.children,
    this.tileWidth = 300,
    this.tileHegiht = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: children
          .map((child) => SizedBox(
                width: tileWidth,
                height: tileHegiht,
                child: Center(child: child),
              ))
          .toList(),
    );
  }
}
