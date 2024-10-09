import 'package:dio/dio.dart';

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
