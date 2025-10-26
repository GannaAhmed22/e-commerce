import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  // Colors
  static const Color white = Colors.white;
  static const Color blue = Color(0xFF1E88E5); // You can change this shade
  static const Color black = Colors.black;

  // Header 1
  static TextStyle header1({Color color = black}) => GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    
    color: color,
  );

  // Small text
  static TextStyle smallText({Color color = black}) => GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: color,
  );

  // Old price
  static TextStyle oldPrice({Color color = black}) => GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: color,
    decoration: TextDecoration.lineThrough,
  );

  // Sub-category
  static TextStyle subCategory({Color color = black}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color,
  );

  // General text
  static TextStyle generalText({Color color = black}) => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color,
  );

  // Button
  static TextStyle button({Color color = white}) => GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: color,
  );
}
