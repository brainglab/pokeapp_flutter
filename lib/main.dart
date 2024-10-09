import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/presentation/helpers/hex_color.dart';
import 'package:pokeapp_flutter/presentation/pages/splash_page.dart';

Future<void> main() async {
  // esto requiere para la base de datos
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

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
