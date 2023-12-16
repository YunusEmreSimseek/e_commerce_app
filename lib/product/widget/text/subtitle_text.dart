import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.general.textTheme.titleMedium?.copyWith(),
    );
  }
}
