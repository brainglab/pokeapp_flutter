import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/presentation/helpers/hex_color.dart';
import 'package:pokeapp_flutter/presentation/pages/splash_page.dart';

/// Punto de entrada principal de la aplicación.
///
/// Esta función asíncrona es el punto de inicio de la aplicación Flutter.
/// Se encarga de inicializar los componentes necesarios y lanzar la interfaz de usuario.
///
/// Pasos que realiza:
/// 1. Asegura que los widgets de Flutter estén inicializados, lo cual es necesario
///    para operaciones que involucran la interfaz de usuario o el acceso a plugins.
/// 2. Ejecuta la aplicación principal envuelta en un ProviderScope para la gestión de estado.
///
/// Es importante que esta función sea asíncrona (async) para permitir
/// cualquier inicialización que pueda requerir operaciones asíncronas en el futuro.
Future<void> main() async {
  // esto requiere para la base de datos
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/// MyApp es la clase principal que define la estructura y configuración de la aplicación.
///
/// Esta clase extiende StatelessWidget, lo que significa que describe parte de
/// la interfaz de usuario que no puede cambiar dinámicamente.
///
/// Características principales:
/// - Define la configuración global de la aplicación, como el tema y las rutas.
/// - Establece el punto de entrada visual de la aplicación.
/// - Configura el MaterialApp, que proporciona funcionalidades básicas de Material Design.
///
/// El uso de StatelessWidget aquí es apropiado porque la configuración general
/// de la aplicación no cambia durante la ejecución. Si se necesitan cambios dinámicos
/// en la configuración global, se pueden manejar a través de providers o state management.
///
/// Esta clase es crucial para la inicialización y estructura general de la aplicación,
/// estableciendo el contexto y el estilo visual para todos los widgets hijos.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorObservers: const [], // <--- esto es para el RouterObserver de la ruta
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: HexColor.fromHex('#02dfbb')),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {'/': (BuildContext context) => const SplashPage()},
    );
  }
}
