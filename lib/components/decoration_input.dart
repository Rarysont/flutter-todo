import 'package:flutter/material.dart';
import 'package:studies/_common/colors.dart';

InputDecoration getDecorationInput(String label) {
  return InputDecoration(
      hintText: label,
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 2)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 4)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.black)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: MyColors.darkBlue, width: 3)));
}
