import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const Badge({
    Key key,
    @required this.backgroundColor,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        child: child,
      ),
    );
  }
}