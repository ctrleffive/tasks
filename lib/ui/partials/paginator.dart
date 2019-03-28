import 'package:flutter/material.dart';

class Paginator extends StatelessWidget {
  final int totalPages;
  final int activePage;

  Paginator({
    @required this.activePage,
    @required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(this.totalPages, (int index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: index == this.activePage ? 15 : 8,
          margin: EdgeInsets.only(right: 5),
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: index == this.activePage ? Colors.white70 : Colors.white24,
          ),
        );
      }),
    );
  }
}