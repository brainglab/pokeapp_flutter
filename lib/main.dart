import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // esto requiere para la base de datos
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: const [
        // ChangeNotifierProvider(create: (_) => GlobalProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        navigatorObservers: const [], // <--- esto es para el RouterObserver de la ruta
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Container());
  }
}
