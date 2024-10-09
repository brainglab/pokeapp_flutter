/// Capitaliza la primera letra de un texto dado.
///
/// Este método toma una cadena de texto como entrada y devuelve una nueva cadena
/// con la primera letra en mayúscula y el resto en minúsculas.
///
/// Características principales:
/// - Convierte la primera letra del texto a mayúscula.
/// - Convierte el resto del texto a minúsculas.
/// - Maneja correctamente cadenas vacías.
///
/// @param mText La cadena de texto que se desea capitalizar.
/// @return Una nueva cadena con la primera letra en mayúscula y el resto en minúsculas.
///
/// Ejemplo de uso:
/// ```dart
/// String texto = "hOLA mUNDO";
/// String textoCapitalizado = capitalizeText(texto);
/// print(textoCapitalizado); // Imprime: "Hola mundo"
/// ```
///
/// Nota: Si la cadena de entrada está vacía, se devuelve la misma cadena sin modificar.
String capitalizeText(String mText) {
  if (mText.isEmpty) return mText;
  return mText[0].toUpperCase() + mText.substring(1).toLowerCase();
}
