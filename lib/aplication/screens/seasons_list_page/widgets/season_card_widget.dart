import 'package:flutter/material.dart';

class SeasonCardWidget extends StatelessWidget {
  final String image;
  final void Function()? onTap;

  const SeasonCardWidget({super.key, 
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 2.0,
              offset: Offset(
                1.0,
                1.0,
              ), // shadow direction: bottom right
            )
          ],
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(color: Colors.green, width: 0.3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
