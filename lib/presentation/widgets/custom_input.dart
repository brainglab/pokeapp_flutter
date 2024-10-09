import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';

/// CustomInput es un widget personalizado que extiende ConsumerWidget para crear campos de entrada de texto personalizables.
///
/// Este widget proporciona una amplia gama de opciones de personalización para crear campos de entrada
/// que se adaptan a las necesidades específicas de la aplicación.
///
/// Características principales:
/// - Personalización de título, sugerencia (hint), controlador, validador y nodo de enfoque.
/// - Opción para ocultar contraseñas.
/// - Capacidad para especificar el tipo de entrada de texto y el número máximo de líneas.
/// - Función de callback para manejar cambios en el texto.
/// - Integración con Riverpod para la gestión de estado y temas.
///
/// Uso típico:
/// ```dart
/// CustomInput(
///   title: 'Nombre de usuario',
///   hint: 'Ingrese su nombre de usuario',
///   validator: (value) => value.isEmpty ? 'Este campo es requerido' : null,
///   controller: _usernameController,
/// )
/// ```
///
/// Esta clase es ideal para mantener una apariencia consistente de los campos de entrada en toda la aplicación,
/// mientras permite la flexibilidad necesaria para casos de uso específicos.
class CustomInput extends ConsumerWidget {
  const CustomInput({
    super.key,
    this.title,
    this.hint,
    this.controller,
    required this.validator,
    this.node,
    this.obscurePassword,
    this.width,
    this.textInputType,
    this.maxLines,
    this.callback,
  });

  final double? width;
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final Function validator;
  final FocusNode? node;
  final bool? obscurePassword;
  final TextInputType? textInputType;
  final int? maxLines;
  final Function? callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mShowSuffixIcon = obscurePassword != null;
    final mPasswordVisible = obscurePassword ?? false;

    bool mIsDarkTheme = ref.watch(mIsDarkThemeProvider);
    BlTheme mBlTheme = BlTheme(mIsDarkTheme: mIsDarkTheme);

    return Container(
      width: width,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        focusNode: node,
        onChanged: (String text) async {
          if (callback != null) {
            callback!();
          }
        },
        onFieldSubmitted: (String text) {
          if (controller != null && maxLines != null) {
            int mCount = controller!.text.split('\n').length;
            log('==> son $mCount Enters');
            if (mCount <= maxLines!) {
              controller!.value = TextEditingValue(text: "${controller!.text}\n", selection: TextSelection(baseOffset: controller!.text.length, extentOffset: controller!.text.length));
              FocusScope.of(context).requestFocus();
            }
          }
        },
        validator: (value) => validator(value),
        controller: controller,
        keyboardType: (maxLines == null ? textInputType : TextInputType.text),
        textInputAction: (maxLines == null ? TextInputAction.next : TextInputAction.done),
        obscureText: mPasswordVisible,
        style: mBlTheme.mTextStyleBlack,
        cursorColor: mBlTheme.mColorAccent,
        autofocus: true,
        maxLines: (maxLines ?? 1),
        decoration: InputDecoration(
          filled: true,
          fillColor: mBlTheme.mColorLight,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: mBlTheme.mColorGray, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: mBlTheme.mColorRed,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: mBlTheme.mColorRed,
              width: 2,
            ),
          ),
          labelText: title,
          labelStyle: mBlTheme.mTextStyleBlack,
          errorStyle: mBlTheme.mTextStyleRedSmall,
          contentPadding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          hintStyle: mBlTheme.mTextStyleLight,
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: mBlTheme.mColorAccent,
              width: 2,
            ),
          ),
          suffixIcon: mShowSuffixIcon
              ? IconButton(
                  icon: Icon(
                    mPasswordVisible ? TablerIcons.eye : TablerIcons.eye_closed,
                    color: mBlTheme.mColorLight,
                    size: 25,
                  ),
                  onPressed: () {
                    // Nota: No podemos cambiar el estado directamente en un StatelessWidget
                    // Se necesitaría un callback para manejar este cambio desde el widget padre
                  },
                )
              : const SizedBox(height: 0, width: 0),
        ),
      ),
    );
  }
}
