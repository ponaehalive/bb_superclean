import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String image;
  final void Function()? onTap;

  const MovieCard({super.key, 
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 2.0,
                offset: Offset(
                  1.0,
                  1.0,
                ), 
              )
            ],
            borderRadius: BorderRadius.circular(5),
           
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
