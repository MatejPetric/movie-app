import 'package:flutter/material.dart';
import 'package:movie_app/features/bottom_navigation/widgets/bottom_navigation_widget.dart';

class BottomNavigationScreen extends StatelessWidget {
  final Widget child;
  const BottomNavigationScreen({required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
