import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';
import 'package:pokeapp_flutter/presentation/routes/route.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ConsumerState<SplashPage> with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController? mAnimacionController;
  Animation<double>? mAnimacionLogo;
  Animation<double>? mAnimacionPokes;
  Animation<double>? mAnimacionFondo;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // esto es para que se oculte el teclado
      SystemChannels.textInput.invokeMethod('TextInput.hide');

      startTime(RoutePage.home);
    });

    // Animación del logo
    mAnimacionController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    mAnimacionLogo = CurvedAnimation(parent: mAnimacionController!, curve: Curves.easeOut);
    mAnimacionLogo!.addListener(() => setState(() {}));
    mAnimacionController!.forward();

    // Animación de los Pokémon
    mAnimacionPokes = CurvedAnimation(parent: mAnimacionController!, curve: Curves.easeOut);
    mAnimacionPokes!.addListener(() => setState(() {}));

    mAnimacionFondo = CurvedAnimation(parent: mAnimacionController!, curve: Curves.easeOut);
    mAnimacionFondo!.addListener(() => setState(() {}));

    // Retraso para la animación de los Pokémon
    Future.delayed(const Duration(seconds: 2), () {
      mAnimacionController!.forward();
    });

    setState(() {
      _visible = !_visible;
    });
  }

  void startTime(RoutePage mPage) {
    Timer(const Duration(seconds: 5), () {
      globalContext = context;
      navigate(globalContext!, mPage);
    });
  }

  @override
  void dispose() {
    mAnimacionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool mIsDarkTheme = ref.watch(mIsDarkThemeProvider);
    BlTheme mBlTheme = BlTheme(mIsDarkTheme: mIsDarkTheme);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: mBlTheme.mColorBackgroundSplash,
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: mAnimacionFondo!,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/background_01.jpg'),
                    fit: BoxFit.cover,
                    opacity: mAnimacionFondo!.value,
                  ),
                ),
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Text('Powered by', style: mBlTheme.mTextStyleWhiteSmall),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    'assets/images/brainglab_spa_white.png',
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: mAnimacionLogo!,
                builder: (context, child) {
                  return Transform.scale(
                    scale: mAnimacionLogo!.value,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 250,
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: mAnimacionPokes!,
                builder: (context, child) {
                  return Transform.scale(
                    scale: mAnimacionPokes!.value,
                    child: Image.asset(
                      'assets/images/pockes.png',
                      width: 300,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
