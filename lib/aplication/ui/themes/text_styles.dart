import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';


abstract class TextStyles {
  static final titleFont = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 17,
    color: AppColors.white,
  );

  static final labelStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: AppColors.white,
  );

  static final buttonLabelStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: AppColors.white,
  );
}