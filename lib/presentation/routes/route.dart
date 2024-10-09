import 'package:flutter/material.dart';
import 'package:pokeapp_flutter/presentation/pages/detail_page.dart';
import 'package:pokeapp_flutter/presentation/pages/home_page.dart';
import 'package:pokeapp_flutter/presentation/pages/splash_page.dart';

/// Enumeración que define los tipos de animaciones disponibles para las transiciones de rutas.
///
/// Esta enumeración proporciona diferentes opciones de animación que se pueden utilizar
/// al navegar entre páginas en la aplicación. Cada tipo de animación ofrece una
/// experiencia visual distinta durante la transición.
///
/// Valores:
/// - [transition]: Representa una transición estándar, generalmente un deslizamiento.
/// - [scale]: Indica una animación de escala, donde la nueva página crece desde un punto.
/// - [fade]: Representa una transición de desvanecimiento, donde la nueva página aparece gradualmente.
/// - [scaleFade]: Combina las animaciones de escala y desvanecimiento para un efecto más complejo.
///
/// Uso típico:
/// ```dart
/// TypeAnimation animationType = TypeAnimation.fade;
/// // Utilizar 'animationType' al definir la transición de una ruta
/// ```
///
/// Esta enumeración es crucial para personalizar la experiencia de navegación del usuario,
/// permitiendo seleccionar el tipo de animación más adecuado para cada transición en la aplicación.
enum TypeAnimation {
  transition,
  scale,
  fade,
  scaleFade,
}

/// Enumeración que define las páginas principales de la aplicación.
///
/// Esta enumeración representa las diferentes páginas o rutas principales
/// que existen en la aplicación. Cada valor corresponde a una página específica,
/// facilitando la navegación y la gestión de rutas en toda la app.
///
/// Valores:
/// - [splash]: Representa la página de inicio o splash screen de la aplicación.
///   Esta es típicamente la primera página que ve el usuario al abrir la app.
///
/// - [home]: Representa la página principal o home de la aplicación.
///   Es la página central desde donde el usuario puede acceder a las principales funcionalidades.
///
/// - [detail]: Representa la página de detalle, probablemente utilizada para mostrar
///   información más específica sobre un elemento seleccionado (por ejemplo, detalles de un Pokémon).
///
/// Uso típico:
/// ```dart
/// RoutePage currentPage = RoutePage.home;
/// navigate(context, currentPage);
/// ```
///
/// Beneficios:
/// 1. Proporciona una forma centralizada y tipada de referirse a las páginas de la aplicación.
/// 2. Mejora la legibilidad del código al usar nombres descriptivos para las rutas.
/// 3. Facilita la implementación de lógica de navegación y la gestión de rutas.
/// 4. Ayuda a prevenir errores de escritura al referirse a rutas específicas.
///
/// Esta enumeración es fundamental para la estructura de navegación de la aplicación,
/// permitiendo un manejo más organizado y seguro de las transiciones entre páginas.
enum RoutePage {
  splash,
  home,
  detail,
}

/// Observador de rutas para la aplicación.
///
/// Este [RouteObserver] se utiliza para monitorear y reaccionar a los cambios
/// en la navegación de la aplicación.
///
/// Características principales:
/// - Permite observar transiciones entre rutas en la aplicación.
/// - Facilita la implementación de lógica basada en cambios de navegación.
/// - Es útil para realizar acciones específicas cuando una ruta es empujada o eliminada.
///
/// Uso típico:
/// ```dart
/// MaterialApp(
///   navigatorObservers: [mRouteObserver],
///   // ... otras configuraciones
/// )
/// ```
///
/// Beneficios:
/// 1. Permite implementar análisis de navegación.
/// 2. Facilita la ejecución de acciones específicas en cambios de ruta.
/// 3. Ayuda en la depuración de problemas relacionados con la navegación.
/// 4. Permite la implementación de funcionalidades avanzadas como animaciones personalizadas entre rutas.
///
/// Este observador es esencial para tener un control granular sobre la navegación
/// en la aplicación, mejorando la experiencia del usuario y facilitando el desarrollo
/// de características basadas en el flujo de navegación.
final RouteObserver<ModalRoute<void>> mRouteObserver = RouteObserver<ModalRoute<void>>();

/// Contexto global para la navegación.
///
/// Este [BuildContext] se utiliza para mantener una referencia global a la
/// pantalla actual en la que se está navegando.
///
/// Características principales:
/// - Permite acceder al contexto actual de la pantalla.
/// - Es útil para realizar acciones específicas en la pantalla actual.
BuildContext? globalContext;

/// Navega a una página específica de la aplicación.
///
/// Este método maneja la navegación entre diferentes páginas de la aplicación,
/// utilizando la enumeración [RoutePage] para especificar el destino.
///
/// Parámetros:
/// - [mContext]: El contexto de construcción actual, necesario para la navegación.
/// - [mPage]: La página de destino, especificada como un valor de [RoutePage].
/// - [finishCurrent]: Un booleano opcional que indica si se debe cerrar la página actual
///   antes de navegar a la nueva. Por defecto es false.
///
/// Funcionalidad:
/// 1. Si [finishCurrent] es true, cierra la página actual.
/// 2. Actualiza el contexto global con el contexto proporcionado.
/// 3. Registra la navegación en los logs de depuración.
/// 4. Realiza la navegación según la página especificada en [mPage].
///
/// Uso típico:
/// ```dart
/// navigate(context, RoutePage.home);
/// ```
///
/// Beneficios:
/// - Centraliza la lógica de navegación, facilitando su mantenimiento.
/// - Permite una navegación consistente en toda la aplicación.
/// - Ofrece flexibilidad para cerrar o mantener la página actual durante la navegación.
///
/// Nota: Este método utiliza el contexto global y las rutas definidas en la enumeración [RoutePage].
navigate(BuildContext mContext, RoutePage mPage, {bool finishCurrent = false}) {
  // close current
  if (finishCurrent) {
    Navigator.pop(globalContext!);
  }

  globalContext = mContext;

  debugPrint("\n\n==> navigate: $mPage \n\n");
  switch (mPage) {
    case RoutePage.splash:
      Navigator.of(globalContext!).pushAndRemoveUntil(_goPage(const SplashPage(), TypeAnimation.transition, 400), (Route<dynamic> route) => false);
      break;
    case RoutePage.home:
      Navigator.of(globalContext!).pushAndRemoveUntil(_goPage(const HomePage(), TypeAnimation.transition, 400), (Route<dynamic> route) => false);
      break;
    case RoutePage.detail:
      Navigator.of(globalContext!).push(_goPage(const DetailPage(), TypeAnimation.transition, 400));
      break;
    default:
      break;
  }
}

/// Crea una ruta animada para la transición entre páginas.
///
/// Este método genera una ruta personalizada con animaciones para la transición
/// entre diferentes páginas de la aplicación.
///
/// Parámetros:
/// - [page]: El widget de la página de destino a la que se navegará.
/// - [type]: El tipo de animación a utilizar, definido por la enumeración [TypeAnimation].
/// - [milliseconds]: La duración de la animación en milisegundos.
///
/// Funcionalidad:
/// 1. Crea un [PageRouteBuilder] personalizado.
/// 2. Define la duración de la transición.
/// 3. Implementa diferentes tipos de animaciones según el parámetro [type].
///
/// Tipos de animaciones soportadas:
/// - [TypeAnimation.transition]: Animación de deslizamiento horizontal.
/// - [TypeAnimation.scale]: Animación de escala.
///
/// Retorna:
/// Una [Route] personalizada con la animación especificada.
///
/// Uso típico:
/// ```dart
/// Navigator.of(context).push(_goPage(NuevaPagina(), TypeAnimation.transition, 400));
/// ```
///
/// Beneficios:
/// - Proporciona transiciones suaves y personalizables entre páginas.
/// - Mejora la experiencia del usuario con animaciones fluidas.
/// - Permite flexibilidad en el tipo y duración de las animaciones.
Route _goPage(Widget page, TypeAnimation type, int milliseconds) {
  return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
      transitionDuration: Duration(milliseconds: milliseconds),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final mCurveAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        switch (type) {
          case TypeAnimation.transition:
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(mCurveAnimation),
              child: child,
            );

          case TypeAnimation.scale:
            return ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(mCurveAnimation),
              child: child,
            );

          default:
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(mCurveAnimation),
              child: child,
            );
        }
      });
}
