import 'package:flutter/material.dart';
import 'package:movie_app/theme/my_colors/my_colors_dark.dart';

class MyInkWellWidget extends StatefulWidget {
  final Widget Function(bool isTapped) builder;
  final VoidCallback onTap;
  const MyInkWellWidget({
    super.key,
    required this.builder,
    required this.onTap,
  });

  @override
  State<MyInkWellWidget> createState() => _MyInkWellWidgetState();
}

class _MyInkWellWidgetState extends State<MyInkWellWidget> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: myColorsDark.splash,
        customBorder: const CircleBorder(),
        onTap: widget.onTap,
        onHighlightChanged: (isTapped) =>
            setState(() => this.isTapped = isTapped),
        child: widget.builder(isTapped),
      ),
    );
  }
}
