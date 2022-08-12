import 'package:flutter/material.dart';
import 'package:one_screen_test/common/ui/color.dart';

class TypeContainer extends StatelessWidget {
  final String title;
  final bool isActive;
  final Function onTab;
  const TypeContainer({
    Key? key,
    required this.isActive,
    required this.title,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTab();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isActive ? AppColors.main : AppColors.lightMain,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
