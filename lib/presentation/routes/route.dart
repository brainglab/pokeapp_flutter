import 'package:flutter/material.dart';
import 'package:pokeapp_flutter/presentation/pages/detail_page.dart';
import 'package:pokeapp_flutter/presentation/pages/home_page.dart';
import 'package:pokeapp_flutter/presentation/pages/splash_page.dart';

enum TypeAnimation {
  transition,
  scale,
  fade,
  scaleFade,
}

enum RoutePage {
  splash,
  home,
  detail,
}

// Register the RouteObserver as a navigation observer.
final RouteObserver<ModalRoute<void>> mRouteObserver = RouteObserver<ModalRoute<void>>();

BuildContext? globalContext;

// change page
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

// animation for change page
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
