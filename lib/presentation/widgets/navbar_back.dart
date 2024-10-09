import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';
import 'package:pokeapp_flutter/presentation/widgets/custom_button.dart';

/// NavbarBack es un widget personalizado que implementa una barra de navegación con funcionalidad de retroceso.
///
/// Este widget extiende ConsumerWidget para integrarse con Riverpod y implementa PreferredSizeWidget
/// para definir un tamaño preferido, lo que permite su uso como AppBar en un Scaffold.
///
/// Características principales:
/// - Personalizable con título, colores de fondo, botones de retroceso y menú.
/// - Integración con el sistema de temas de la aplicación.
/// - Capacidad para mostrar acciones adicionales en la barra.
/// - Ajuste automático del estilo de la barra de estado del sistema.
///
/// Uso típico:
/// ```dart
/// Scaffold(
///   appBar: NavbarBack(
///     mTitle: 'Página Principal',
///     mShowBack: true,
///     mGoBack: () => Navigator.pop(context),
///   ),
///   body: // ... contenido del cuerpo
/// )
/// ```
///
/// Este widget es ideal para mantener una apariencia consistente en la navegación
/// de la aplicación, adaptándose al tema actual y proporcionando opciones de personalización.
class NavbarBack extends ConsumerWidget implements PreferredSizeWidget {
  const NavbarBack({
    super.key,
    this.mTitle,
    this.mBackgroundColor,
    this.mBackgroundButtonColor,
    this.mShowBack = false,
    this.mShowMenu = false,
    this.mGoBack,
    this.mListActions,
    this.mMenu,
  }) : preferredSize = const Size.fromHeight(
          kToolbarHeight,
        );

  @override
  final Size preferredSize;

  final String? mTitle;
  final Color? mBackgroundColor;
  final Color? mBackgroundButtonColor;
  final bool? mShowBack;
  final bool? mShowMenu;
  final Function? mGoBack;
  final List<Widget>? mListActions;
  final Widget? mMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mIsDarkTheme = ref.watch(mIsDarkThemeProvider);
    BlTheme mBlTheme = BlTheme(mIsDarkTheme: mIsDarkTheme);

    return AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Estado de la barra de color
          statusBarColor: mBlTheme.mColorLight,

          // Brillo de la barra de estado (opcional)
          statusBarIconBrightness: (mIsDarkTheme ? Brightness.light : Brightness.dark), // Para Android (iconos oscuros)
          statusBarBrightness: (mIsDarkTheme ? Brightness.dark : Brightness.light), // Para iOS (iconos oscuros)
        ),
        surfaceTintColor: mBlTheme.mColorBackgroundLayout,
        backgroundColor: mBlTheme.mColorBackgroundLayout,
        iconTheme: const IconThemeData(),
        centerTitle: true,
        title: Container(
          color: mBlTheme.mColorBackgroundLayout,
          child: Text(
            (mTitle == null ? "" : mTitle!),
            style: (mIsDarkTheme ? mBlTheme.mTextStyleBlackTitle : mBlTheme.mTextStyleBlackTitle),
            textAlign: TextAlign.center,
          ),
        ),
        elevation: 0,
        leading: (mShowBack == true
            ? Container(
                width: 25,
                height: 25,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(mBlTheme.mRadius),
                  color: mBlTheme.mColorLight,
                ),
                child: CustomButton(
                  color: Colors.transparent,
                  width: 50,
                  callback: () async {
                    Navigator.of(context).pop();
                    // Si el navegador recibió una función de devolución de llamada, llámela
                    if (mGoBack != null) {
                      mGoBack!();
                    }
                  },
                  child: Icon(
                    TablerIcons.arrow_left,
                    color: mBlTheme.mColorBlack,
                    size: 30,
                  ),
                ))
            : (mShowMenu == true
                ? CustomButton(
                    color: mBlTheme.mColorBackgroundLayout,
                    borderRadius: 500,
                    child: Icon(
                      TablerIcons.menu,
                      color: (mIsDarkTheme ? mBlTheme.mColorBlack : mBlTheme.mColorWhite),
                      size: 22,
                    ),
                    callback: () => Scaffold.of(context).openDrawer(),
                  )
                : null)),
        actions: mListActions);
  }
}
