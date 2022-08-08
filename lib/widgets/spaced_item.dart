import 'package:flutter/material.dart';

class SpacedItem extends StatelessWidget {
  const SpacedItem({
    Key? key,
    required this.name,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(width: 150, child: Text(name)),
        ),
        Flexible(
          child:
              Padding(padding: const EdgeInsets.only(right: 8.0), child: child),
        )
      ],
    );
  }
}
