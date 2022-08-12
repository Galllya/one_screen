import 'package:flutter/material.dart';

class CountryContainer extends StatelessWidget {
  final String picName;
  final String countryName;
  const CountryContainer({
    Key? key,
    required this.countryName,
    required this.picName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          SizedBox(
            height: 30,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                6,
              ),
              child: Image.asset(
                'assets/pictures/pic_$picName.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            countryName,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
