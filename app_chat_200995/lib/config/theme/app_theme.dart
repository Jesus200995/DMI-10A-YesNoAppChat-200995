import 'package:flutter/material.dart';

/// Flutter tip
/// Al utilizar hexadecial color usar prefijo
/// 0xFF
/// antes del color
///
const Color _customColor = Color(0xFF5C11D4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0}) : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1, 'Colors must be between 0 and ${_colorThemes.length - 1 }');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true, // Config para utilizar Material 3

      colorSchemeSeed:
          _colorThemes[selectedColor], // Utilizar paleta de colores customs
          // brightness: Brightness.dark, // Aplicar tema oscuro de manera global
    );
  }
}
