import 'package:flutter/material.dart';
import 'package:one_screen_test/common/ui/color.dart';

class CustomContainer extends StatelessWidget {
  final Widget content;
  const CustomContainer({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.pink.withOpacity(0.10),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: content,
      ),
    );
  }
}
