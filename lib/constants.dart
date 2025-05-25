import 'package:flutter/material.dart';

const kBackgroundColor = Color(0xFF090C20);
const kTileColor = Color(0xFF1D1F33);
const kSelectedTileColor = Color.fromARGB(255, 236, 8, 84);
const kActiveTextColor = Color(0xFFFFFFFF);
const kInactiveTextColor = Color(0xFF8D8E98);
const kButtonColor = Color(0xFFEB1555);
const kButtonTextColor = Color(0xFFFFFFFF);

var kTileBorderDecoration = BoxDecoration(
  color: kTileColor,
  borderRadius: BorderRadius.circular(5),
);

var kSelectedTileBorderDecoration = BoxDecoration(
  color: kSelectedTileColor,
  borderRadius: BorderRadius.circular(5),
);
