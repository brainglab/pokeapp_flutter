import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';

/// Loading es un widget personalizado que extiende ConsumerWidget para mostrar un indicador de carga.
///
/// Este widget proporciona una forma flexible y personalizable de mostrar un indicador de carga
/// en la aplicación, adaptándose al tema actual y permitiendo la personalización del tipo de indicador,
/// color y tamaño.
///
/// Características principales:
/// - Utiliza el paquete 'loading_indicator' para mostrar diversos tipos de animaciones de carga.
/// - Se integra con Riverpod para acceder al estado del tema de la aplicación.
/// - Permite personalizar el tipo de indicador, color y tamaño.
/// - Se adapta automáticamente al tema claro/oscuro de la aplicación.
///
/// Uso típico:
/// ```dart
/// Loading(
///   mIndicator: Indicator.ballPulse,
///   mColor: Colors.blue,
///   mSize: 30,
/// )
/// ```
///
/// Este widget es ideal para mostrar estados de carga en diferentes partes de la aplicación,
/// manteniendo una apariencia consistente y personalizable.
class Loading extends ConsumerWidget {
  const Loading({super.key, this.mIndicator, this.mColor, this.mSize});

  final Indicator? mIndicator;
  final Color? mColor;
  final double? mSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mIsDarkTheme = ref.watch(mIsDarkThemeProvider);
    BlTheme mBlTheme = BlTheme(mIsDarkTheme: mIsDarkTheme);

    return Container(
      alignment: Alignment.center,
      width: (mSize ?? 20),
      height: (mSize ?? 20),
      child: Center(
        child: LoadingIndicator(
          indicatorType: (mIndicator == null ? Indicator.ballBeat : mIndicator!),
          colors: [(mColor ?? mBlTheme.mColorAccent)],
        ),
      ),
    );
  }
}
