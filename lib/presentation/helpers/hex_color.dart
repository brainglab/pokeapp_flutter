import 'package:flutter/material.dart';

/// Extensión para la clase Color que proporciona funcionalidad para convertir
/// colores hexadecimales a objetos Color de Flutter y viceversa.
///
/// Esta extensión añade dos métodos estáticos a la clase Color:
/// 1. [fromHex]: Convierte una cadena hexadecimal en un objeto Color.
/// 2. [toHex]: Convierte un objeto Color en una cadena hexadecimal.
///
/// Uso típico:
/// ```dart
/// // Convertir de hexadecimal a Color
/// Color myColor = HexColor.fromHex("#FF5733");
///
/// // Convertir de Color a hexadecimal
/// String hexString = myColor.toHex();
/// ```
///
/// Esta extensión es útil para trabajar con colores en formato hexadecimal,
/// que es común en diseño web y en especificaciones de diseño,
/// permitiendo una fácil integración con el sistema de colores de Flutter.
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
