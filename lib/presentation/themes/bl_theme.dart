import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokeapp_flutter/presentation/helpers/hex_color.dart';

/// Clase que define el tema y estilos visuales de la aplicación.
///
/// [BlTheme] encapsula todos los elementos de diseño necesarios para mantener
/// una apariencia consistente en toda la aplicación, incluyendo colores,
/// dimensiones, y estilos de texto.
///
/// Características principales:
/// - Define dimensiones estándar para padding, radios y avatares.
/// - Establece una paleta de colores para diferentes propósitos en la UI.
/// - Proporciona estilos de texto predefinidos para varios tamaños y colores.
/// - Configura colores específicos para diferentes elementos de la interfaz.
///
/// Uso típico:
/// ```dart
/// final theme = BlTheme();
/// // Acceder a colores
/// Color primaryColor = theme.mColorPrimary;
/// // Usar estilos de texto
/// Text('Título', style: theme.mTextStylePrimaryJumbo);
/// ```
///
/// Esta clase es fundamental para mantener la coherencia visual y facilitar
/// cambios globales en el diseño de la aplicación. Se recomienda utilizarla
/// en conjunto con un sistema de temas de Flutter para una mayor flexibilidad.
class BlTheme {
  // dimensions
  late double mPadding;
  late double mRadius;
  late double mAvatarRadius;

  // Colores
  late Color mColorAccent;
  late Color mColorPrimary;
  late Color mColorRed;
  late Color mColorWhite;
  late Color mColorBlack;
  late Color mColorGray;
  late Color mColorLight;
  late Color mColorDark;
  late Color mColorOpacity;

  // Colores de diseño
  late Color mColorBackgroundSplash;
  late Color mColorBackgroundLayout;
  late Color mColorBackgroundLoading;
  late Color mColorBackgroundPanel;

  // text styles
  // =========================================

  // fontsize
  static double fontSizeMega = 40;
  static double fontSizeJumbo = 20;
  static double fontSizeTitle = 18;
  static double fontSizeNormal = 15;
  static double fontSizeSmall = 11;

  static double letterSpacing = -2;

  // Estilo de texto mega
  late TextStyle mTextStylePrimaryMega;
  late TextStyle mTextStyleAccentMega;
  late TextStyle mTextStyleRedMega;
  late TextStyle mTextStyleWhiteMega;
  late TextStyle mTextStyleBlackMega;
  late TextStyle mTextStyleGrayMega;
  late TextStyle mTextStyleLightMega;

  // text style jumbo
  late TextStyle mTextStylePrimaryJumbo;
  late TextStyle mTextStyleAccentJumbo;
  late TextStyle mTextStyleRedJumbo;
  late TextStyle mTextStyleWhiteJumbo;
  late TextStyle mTextStyleBlackJumbo;
  late TextStyle mTextStyleGrayJumbo;
  late TextStyle mTextStyleLightJumbo;

  // text style title
  late TextStyle mTextStylePrimaryTitle;
  late TextStyle mTextStyleAccentTitle;
  late TextStyle mTextStyleRedTitle;
  late TextStyle mTextStyleWhiteTitle;
  late TextStyle mTextStyleBlackTitle;
  late TextStyle mTextStyleGrayTitle;
  late TextStyle mTextStyleLightTitle;

  // text style normal
  late TextStyle mTextStylePrimary;
  late TextStyle mTextStyleAccent;
  late TextStyle mTextStyleRed;
  late TextStyle mTextStyleWhite;
  late TextStyle mTextStyleBlack;
  late TextStyle mTextStyleGray;
  late TextStyle mTextStyleLight;

  // text style small
  late TextStyle mTextStylePrimarySmall;
  late TextStyle mTextStyleAccentSmall;
  late TextStyle mTextStyleRedSmall;
  late TextStyle mTextStyleWhiteSmall;
  late TextStyle mTextStyleBlackSmall;
  late TextStyle mTextStyleGraySmall;
  late TextStyle mTextStyleLightSmall;

  // text style bold
  late TextStyle mTextStylePrimaryBold;
  late TextStyle mTextStyleAccentBold;
  late TextStyle mTextStyleRedBold;
  late TextStyle mTextStyleWhiteBold;
  late TextStyle mTextStyleBlackBold;
  late TextStyle mTextStyleGrayBold;
  late TextStyle mTextStyleLightBold;

  // text style semi bold
  late TextStyle mTextStylePrimarySemiBold;
  late TextStyle mTextStyleAccentSemiBold;
  late TextStyle mTextStyleRedSemiBold;
  late TextStyle mTextStyleWhiteSemiBold;
  late TextStyle mTextStyleBlackSemiBold;
  late TextStyle mTextStyleGraySemiBold;
  late TextStyle mTextStyleLightSemiBold;

  // text style bold small
  late TextStyle mTextStylePrimaryBoldSmall;
  late TextStyle mTextStyleAccentBoldSmall;
  late TextStyle mTextStyleRedBoldSmall;
  late TextStyle mTextStyleWhiteBoldSmall;
  late TextStyle mTextStyleBlackBoldSmall;
  late TextStyle mTextStyleGrayBoldSmall;
  late TextStyle mTextStyleLightBoldSmall;

  /// Constructor de la clase BlTheme.
  ///
  /// Este constructor inicializa un tema personalizado para la aplicación,
  /// configurando colores, estilos de texto y otras propiedades visuales.
  ///
  /// @param mIsDarkTheme Un booleano que indica si se debe aplicar el tema oscuro.
  ///        Si es true, se aplicará el tema oscuro; si es false, se aplicará el tema claro.
  ///
  /// Funcionalidad:
  /// - Configura los colores base del tema (primario, acento, rojo, blanco, negro, gris, etc.).
  /// - Ajusta los colores de fondo para diferentes partes de la aplicación.
  /// - Inicializa estilos de texto para diferentes tamaños y pesos (mega, jumbo, título, normal, etc.).
  /// - Adapta los colores y estilos según si se está utilizando el tema oscuro o claro.
  ///
  /// Uso:
  /// ```dart
  /// BlTheme theme = BlTheme(mIsDarkTheme: true); // Para tema oscuro
  /// BlTheme theme = BlTheme(mIsDarkTheme: false); // Para tema claro
  /// ```
  ///
  /// Este constructor es fundamental para mantener una apariencia consistente
  /// en toda la aplicación y facilitar el cambio entre temas oscuro y claro.
  BlTheme({required bool mIsDarkTheme}) {
    mPadding = 20;
    mRadius = 10;
    mAvatarRadius = 50;

    mColorAccent = HexColor.fromHex('#02dfbb');
    mColorPrimary = HexColor.fromHex('#9E3CE8');
    mColorRed = HexColor.fromHex('#E83A30');
    mColorWhite = mIsDarkTheme ? HexColor.fromHex('#000000') : HexColor.fromHex('#FFFFFF');
    mColorBlack = mIsDarkTheme ? HexColor.fromHex('#FFFFFF') : HexColor.fromHex('#000000');
    mColorGray = HexColor.fromHex('#A4ABBE');
    mColorLight = mIsDarkTheme ? HexColor.fromHex('#303030') : HexColor.fromHex('#80FFFFFF');
    mColorDark = mIsDarkTheme ? HexColor.fromHex('#FFFFFF') : HexColor.fromHex('#010101');
    mColorOpacity = HexColor.fromHex('#010101').withOpacity(0.3);

    // Colores de diseño
    mColorBackgroundSplash = mIsDarkTheme ? HexColor.fromHex('#1E1E1E') : HexColor.fromHex('#FFFFFF');
    mColorBackgroundLayout = mIsDarkTheme ? HexColor.fromHex('#1E1E1E') : HexColor.fromHex('#FFFFFF');
    mColorBackgroundLoading = mIsDarkTheme ? HexColor.fromHex('#303030') : HexColor.fromHex('#d3d3e6');
    mColorBackgroundPanel = mIsDarkTheme ? HexColor.fromHex('#1E1E1E') : HexColor.fromHex('#FFFFFF');

    mTextStylePrimaryMega = GoogleFonts.sora(color: mColorPrimary, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
    mTextStyleAccentMega = GoogleFonts.sora(color: mColorAccent, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
    mTextStyleRedMega = GoogleFonts.sora(color: mColorRed, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
    mTextStyleWhiteMega = GoogleFonts.sora(color: mColorWhite, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
    mTextStyleBlackMega = GoogleFonts.sora(color: mColorBlack, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);

    mTextStyleGrayMega = GoogleFonts.sora(color: mColorGray, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
    mTextStyleLightMega = GoogleFonts.sora(color: mColorLight, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);

    // text style jumbo
    mTextStylePrimaryJumbo = GoogleFonts.sora(color: mColorPrimary, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
    mTextStyleAccentJumbo = GoogleFonts.sora(color: mColorAccent, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
    mTextStyleRedJumbo = GoogleFonts.sora(color: mColorRed, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
    mTextStyleWhiteJumbo = GoogleFonts.sora(color: mColorWhite, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
    mTextStyleBlackJumbo = GoogleFonts.sora(color: mColorBlack, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
    mTextStyleGrayJumbo = GoogleFonts.sora(color: mColorGray, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
    mTextStyleLightJumbo = GoogleFonts.sora(color: mColorLight, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);

    // text style title
    mTextStylePrimaryTitle = GoogleFonts.sora(color: mColorPrimary, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
    mTextStyleAccentTitle = GoogleFonts.sora(color: mColorAccent, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
    mTextStyleRedTitle = GoogleFonts.sora(color: mColorRed, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
    mTextStyleWhiteTitle = GoogleFonts.sora(color: mColorWhite, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
    mTextStyleBlackTitle = GoogleFonts.sora(color: mColorBlack, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
    mTextStyleGrayTitle = GoogleFonts.sora(color: mColorGray, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
    mTextStyleLightTitle = GoogleFonts.sora(color: mColorLight, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);

    // text style normal
    mTextStylePrimary = GoogleFonts.sora(color: mColorPrimary, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
    mTextStyleAccent = GoogleFonts.sora(color: mColorAccent, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
    mTextStyleRed = GoogleFonts.sora(color: mColorRed, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
    mTextStyleWhite = GoogleFonts.sora(color: mColorWhite, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
    mTextStyleBlack = GoogleFonts.sora(color: mColorBlack, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
    mTextStyleGray = GoogleFonts.sora(color: mColorGray, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
    mTextStyleLight = GoogleFonts.sora(color: mColorLight, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);

    // text style small
    mTextStylePrimarySmall = GoogleFonts.sora(color: mColorPrimary, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
    mTextStyleAccentSmall = GoogleFonts.sora(color: mColorAccent, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
    mTextStyleRedSmall = GoogleFonts.sora(color: mColorRed, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
    mTextStyleWhiteSmall = GoogleFonts.sora(color: mColorWhite, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
    mTextStyleBlackSmall = GoogleFonts.sora(color: mColorBlack, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
    mTextStyleGraySmall = GoogleFonts.sora(color: mColorGray, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
    mTextStyleLightSmall = GoogleFonts.sora(color: mColorLight, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);

    // text style bold
    mTextStylePrimaryBold = GoogleFonts.sora(color: mColorPrimary, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
    mTextStyleAccentBold = GoogleFonts.sora(color: mColorAccent, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
    mTextStyleRedBold = GoogleFonts.sora(color: mColorRed, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
    mTextStyleWhiteBold = GoogleFonts.sora(color: mColorWhite, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
    mTextStyleBlackBold = GoogleFonts.sora(color: mColorBlack, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
    mTextStyleGrayBold = GoogleFonts.sora(color: mColorGray, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
    mTextStyleLightBold = GoogleFonts.sora(color: mColorLight, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);

    // text style semi bold
    mTextStylePrimarySemiBold = GoogleFonts.sora(color: mColorPrimary, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
    mTextStyleAccentSemiBold = GoogleFonts.sora(color: mColorAccent, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
    mTextStyleRedSemiBold = GoogleFonts.sora(color: mColorRed, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
    mTextStyleWhiteSemiBold = GoogleFonts.sora(color: mColorWhite, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
    mTextStyleBlackSemiBold = GoogleFonts.sora(color: mColorBlack, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
    mTextStyleGraySemiBold = GoogleFonts.sora(color: mColorGray, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
    mTextStyleLightSemiBold = GoogleFonts.sora(color: mColorLight, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);

    // text style bold small
    mTextStylePrimaryBoldSmall = GoogleFonts.sora(color: mColorPrimary, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
    mTextStyleAccentBoldSmall = GoogleFonts.sora(color: mColorAccent, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
    mTextStyleRedBoldSmall = GoogleFonts.sora(color: mColorRed, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
    mTextStyleWhiteBoldSmall = GoogleFonts.sora(color: mColorWhite, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
    mTextStyleBlackBoldSmall = GoogleFonts.sora(color: mColorBlack, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
    mTextStyleGrayBoldSmall = GoogleFonts.sora(color: mColorGray, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
    mTextStyleLightBoldSmall = GoogleFonts.sora(color: mColorLight, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
  }
}
