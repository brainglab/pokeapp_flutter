// Método para capitalizar un texto
String capitalizeText(String mText) {
  if (mText.isEmpty) return mText;
  return mText[0].toUpperCase() + mText.substring(1).toLowerCase();
}
