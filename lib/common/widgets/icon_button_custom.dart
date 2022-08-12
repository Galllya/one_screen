import 'package:flutter/material.dart';
import 'package:one_screen_test/common/ui/color.dart';

class IconButtonCustom extends StatelessWidget {
  final Icon icon;
  const IconButtonCustom({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: icon,
      color: AppColors.main,
    );
  }
}
