import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/presentation/providers/pokemon_image_provider.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';

/// Widget para cargar y mostrar imágenes de red con caché y manejo de estados.
///
/// [BLNetworkImage] es un widget personalizado que extiende [ConsumerWidget] de Riverpod
/// para manejar eficientemente la carga de imágenes desde una URL, con soporte para
/// caché y estados de carga.
///
/// Características principales:
/// - Utiliza Riverpod para gestionar el estado de la carga de imágenes.
/// - Implementa caché de imágenes para mejorar el rendimiento.
/// - Maneja diferentes estados: carga, error y éxito.
/// - Permite personalizar el ajuste de la imagen.
///
/// Parámetros:
/// - [mUrl]: URL de la imagen a cargar (requerido).
/// - [boxFit]: Cómo la imagen debe ajustarse a su contenedor (requerido).
///
/// Uso típico:
/// ```dart
/// BLNetworkImage(
///   mUrl: 'https://ejemplo.com/imagen.jpg',
///   boxFit: BoxFit.cover,
/// )
/// ```
///
/// Este widget es ideal para aplicaciones que necesitan cargar múltiples imágenes
/// de manera eficiente, como listados de Pokémon o galerías de imágenes.
/// Utiliza un sistema de caché interno para optimizar el rendimiento y reducir
/// el consumo de datos.
class BLNetworkImage extends ConsumerWidget {
  const BLNetworkImage({
    super.key,
    @required this.mUrl,
    @required this.boxFit,
  });

  final String? mUrl;
  final BoxFit? boxFit;

  /// Construye un widget de imagen con transición suave.
  ///
  /// Este método privado crea un widget [FadeInImage] que muestra una imagen
  /// con una transición de fundido desde un placeholder hasta la imagen cargada.
  ///
  /// Parámetros:
  /// - [mImage]: Un [Uint8List] que contiene los datos binarios de la imagen a mostrar.
  /// - [mImageAsset]: Ruta del asset local que se usará como placeholder.
  ///
  /// Retorna:
  /// Un widget [FadeInImage] configurado con la imagen proporcionada y un placeholder.
  ///
  /// Funcionamiento:
  /// 1. Utiliza [FadeInImage] para manejar la transición entre el placeholder y la imagen final.
  /// 2. El placeholder se carga desde un asset local especificado en [mImageAsset].
  /// 3. La imagen final se crea a partir de los datos binarios proporcionados en [mImage].
  /// 4. Ambas imágenes (placeholder y final) se ajustan según el [boxFit] especificado en la clase.
  ///
  /// Este método es esencial para proporcionar una experiencia visual fluida al usuario,
  /// evitando cambios bruscos en la interfaz mientras se cargan las imágenes.
  /// Además, permite una fácil personalización del placeholder según el tema de la aplicación.
  Widget _buildImage(Uint8List image, String imageAsset) {
    return FadeInImage(
      placeholder: Image.asset(
        imageAsset,
        fit: boxFit,
      ).image,
      image: Image.memory(image, fit: boxFit).image,
      fit: boxFit,
    );
  }

  /// Construye el widget de imagen de red con caché.
  ///
  /// Este método sobrescribe el método `build` de [ConsumerWidget] para crear
  /// un widget que muestra una imagen de red con manejo de caché y estados de carga.
  ///
  /// @param context El [BuildContext] proporcionado por el framework de Flutter.
  /// @param ref Una referencia [WidgetRef] que permite acceder a los providers.
  ///
  /// @return Un [Widget] que representa la imagen de red con estados de carga y error.
  ///
  /// Funcionamiento:
  /// 1. Determina si el tema actual es oscuro usando el provider `mIsDarkThemeProvider`.
  /// 2. Selecciona la imagen de placeholder adecuada según el tema.
  /// 3. Utiliza `ref.watch` para observar el estado del provider `mCachedPokemonImageProvider`.
  /// 4. Maneja tres estados posibles: datos cargados, cargando y error.
  /// 5. Si los datos están disponibles y no son nulos, muestra la imagen usando `_buildImage`.
  /// 6. En caso de datos nulos, carga o error, muestra la imagen de placeholder.
  ///
  /// Este método es crucial para proporcionar una experiencia de usuario fluida
  /// al cargar imágenes de red, manejando eficientemente el caché, los estados de carga
  /// y adaptándose al tema actual de la aplicación.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mIsDarkTheme = ref.watch(mIsDarkThemeProvider);

    String mImageAsset = mIsDarkTheme ? 'assets/images/no_image_dark.jpg' : 'assets/images/no_image_light.jpg';

    final mImageAsyncValue = ref.watch(mCachedPokemonImageProvider(mUrl!));

    return mImageAsyncValue.when(
      data: (mImage) {
        if (mImage != null) {
          return _buildImage(mImage, mImageAsset);
        } else {
          return Image.asset(
            mImageAsset,
            fit: boxFit,
          );
        }
      },
      loading: () => Image.asset(
        mImageAsset,
        fit: boxFit,
      ),
      error: (_, __) => Image.asset(
        mImageAsset,
        fit: boxFit,
      ),
    );
  }
}
