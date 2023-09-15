import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/app_colors.dart';

class AppTextStyle {

  static TextStyle size48Bold(
      {bool italic = false, Color? color, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 48,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size42Bold(
      {bool italic = false, Color? color, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 42,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size38Bold(
      {bool italic = false, Color? color, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 38,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size32Bold(
      {bool italic = false, Color? color, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size26Bold(
      {bool italic = false, Color? color, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 26,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size24Bold(
      {bool italic = false, Color? color, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size22Bold(
      {bool italic = false, Color? color, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size20Bold(
      {bool italic = false,
        Color? color,
        FontWeight? weight,
        bool singleHeight = false,
      }) {
    return GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: singleHeight ? 1 : 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size18Bold(
      {bool italic = false, Color? color, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size16Bold(
      {bool italic = false,
        Color? color,
        FontWeight? weight,
        bool singleHeight = false}) {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: singleHeight ? 1 : 1.5,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size16Normal(
      {bool italic = false,
        Color? color,
        bool singleHeight = false,
        FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: weight ?? FontWeight.normal,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: singleHeight ? 1 : 1.5,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size14Bold(
      {bool italic = false,
        Color? color,
        FontWeight? weight,
        bool singleHeight = false}) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: singleHeight ? 1 : 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size14Normal(
      {bool italic = false,
        Color? color,
        bool singleHeight = false,
        FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: weight ?? FontWeight.normal,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: singleHeight ? 1 : 1.5,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size12Bold(
      {bool italic = false,
        Color? color,
        FontWeight? weight,
        bool singleHeight = false}) {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: singleHeight ? 1 : 1.25,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size12Normal(
      {bool italic = false,
        Color? color,
        bool singleHeight = false,
        FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: weight ?? FontWeight.normal,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: singleHeight ? 1 : 1.5,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size10Bold(
      {bool italic = false, Color? color, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: weight ?? FontWeight.bold,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: 1,
      color: color ?? AppColors.textDark,
    );
  }

  static TextStyle size10Normal(
      {bool italic = false, Color? color, FontWeight? weight}) {
    return GoogleFonts.poppins(
      fontSize: 10,
      fontWeight: weight ?? FontWeight.normal,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
      height: 1,
      color: color ?? AppColors.textDark,
    );
  }
}