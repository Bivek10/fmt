import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title = "App title",
      required this.statusBarColor,
      this.leadingIcon,
      required this.titleStyle,
      this.onleadingPress});
  final String title;
  final IconData? leadingIcon;
  final TextStyle titleStyle;
  final Function? onleadingPress;
  final Color statusBarColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingIcon == null ? 0 : 56.0,
      leading: IconButton(
        onPressed: () {
          onleadingPress!();
        },
        icon: Icon(leadingIcon),
      ),
      title: Text(
        title,
        style: titleStyle,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: statusBarColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size(Get.width, kToolbarHeight);
}
