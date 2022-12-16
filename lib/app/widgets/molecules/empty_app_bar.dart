import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({super.key, required this.statusBarColor});
  final Color statusBarColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: statusBarColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 0);
}
