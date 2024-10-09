import 'package:dio/dio.dart';

/// Crea y configura una instancia de Dio para realizar solicitudes HTTP.
///
/// Esta función inicializa y configura una instancia de Dio, un cliente HTTP
/// poderoso para Dart, con opciones específicas para las necesidades de la aplicación.
///
/// Características principales:
/// - Configura los encabezados por defecto, incluyendo el tipo de contenido.
/// - Establece tiempos de espera para conexión, recepción y envío.
/// - Prepara la instancia para posibles interceptores adicionales (como Firebase Performance).
///
/// @return Una instancia de [Dio] configurada y lista para usar.
///
/// Uso típico:
/// ```dart
/// final dio = getDio();
/// final response = await dio.get('https://api.example.com/data');
/// ```
///
/// Nota: Los comentarios sobre Firebase Performance están desactivados por defecto,
/// pero pueden ser habilitados si se requiere monitoreo de rendimiento.
Dio getDio() {
  Dio dio = Dio();

  // para implementar firebase performance y evaluar el rendimiento en las conexiónes a la API
  // final performanceInterceptor = DioFirebasePerformanceInterceptor();
  // dio.interceptors.add(performanceInterceptor);

  dio.options.headers.addAll({
    'Content-Type': 'application/json; charset=UTF-8',
    // Añade otras cabeceras aquí
  });

  dio.options
    ..connectTimeout = const Duration(seconds: 40) // 40 segundos para el timeout de conexión
    ..receiveTimeout = const Duration(seconds: 40) // 40 segundos para el timeout de recepción
    ..sendTimeout = const Duration(seconds: 40); // 40 segundos para el timeout de envío

  return dio;
}

/// Crea y configura una instancia de Dio especializada para solicitudes de imágenes.
///
/// Esta función inicializa y configura una instancia de Dio optimizada para
/// manejar solicitudes HTTP específicamente para imágenes. Es similar a la
/// función `getDio()`, pero con ajustes particulares para el manejo de contenido
/// de tipo imagen.
///
/// Características principales:
/// - Configura el encabezado 'Content-Type' para aceptar cualquier tipo de imagen.
/// - Establece tiempos de espera para conexión, recepción y envío, todos a 40 segundos.
/// - Prepara la instancia para un manejo eficiente de datos binarios de imágenes.
///
/// @return Una instancia de [Dio] configurada específicamente para solicitudes de imágenes.
///
/// Uso típico:
/// ```dart
/// final dioImage = getDioImage();
/// final response = await dioImage.get('https://ejemplo.com/imagen.jpg');
/// ```
///
/// Nota: Esta configuración es ideal para descargar imágenes o manejar
/// respuestas que contengan datos de imagen.
Dio getDioImage() {
  Dio dio = Dio();

  dio.options.headers.addAll({
    'Content-Type': 'image/*',
    // Añade otras cabeceras aquí
  });

  dio.options
    ..connectTimeout = const Duration(seconds: 40) // 40 segundos para el timeout de conexión
    ..receiveTimeout = const Duration(seconds: 40) // 40 segundos para el timeout de recepción
    ..sendTimeout = const Duration(seconds: 40); // 40 segundos para el timeout de envío

  return dio;
}
