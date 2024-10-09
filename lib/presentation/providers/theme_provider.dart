import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Proveedor de estado para el tema oscuro.
///
/// Este proveedor utiliza [StateProvider] para manejar un valor booleano
/// que indica si el tema oscuro está activo o no.
///
/// Parámetros:
/// - [ref]: Referencia al ProviderContainer, aunque no se utiliza en este caso.
///
/// Retorna:
/// - Un [bool] que es `false` por defecto, indicando que el tema claro está activo inicialmente.
///
/// Uso:
/// Este proveedor puede ser utilizado en widgets para acceder o modificar
/// el estado del tema de la aplicación.
final mIsDarkThemeProvider = StateProvider<bool>((ref) {
  return false;
});
