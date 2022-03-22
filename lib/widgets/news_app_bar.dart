import 'package:flutter/material.dart';

class NewsSliverAppBar extends StatelessWidget {
  final String? title;
  final bool? pinned;

  const NewsSliverAppBar({
    Key? key,
    this.title,
    this.pinned,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title ?? 'TechCrunch News'),
      pinned: pinned ?? true,
    );
  }
}

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const NewsAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? 'TechCrunch News'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
