import 'package:flutter/material.dart';

class SliverTitleBar extends StatelessWidget {
  const SliverTitleBar(
    this.title, {
    Key? key,
    bool this.hasErrors = false,
  }) : super(key: key);

  final String title;
  final bool hasErrors;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).canvasColor,
      // Removes the back button
      automaticallyImplyLeading: false,
      // Keeps the text at the Top of the screen
      pinned: true,
      elevation: 0,
      title: hasErrors
          ? Text(
              title,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            )
          : Text(
              title,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
    );
  }
}
