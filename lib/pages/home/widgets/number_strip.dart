import 'package:flutter/material.dart';
import 'package:one_screen_test/common/ui/color.dart';

class NumberStrip extends StatelessWidget {
  const NumberStrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.phone_iphone,
                color: AppColors.main,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '+1(201)123-45-67',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'New Jersey',
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: const [
              CustomCyrcle(
                title: 'S',
              ),
              SizedBox(
                width: 10,
              ),
              CustomCyrcle(
                title: 'V',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomCyrcle extends StatelessWidget {
  final String title;
  const CustomCyrcle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.main,
      radius: 14,
      child: Text(
        title,
        style: const TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w800),
      ),
    );
  }
}
