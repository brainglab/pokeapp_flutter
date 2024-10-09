import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';

class Loading extends ConsumerWidget {
  const Loading({super.key, this.mIndicator, this.mColor, this.mSize});

  final Indicator? mIndicator;
  final Color? mColor;
  final double? mSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mIsDarkTheme = ref.watch(isDarkThemeProvider);
    BlTheme mBlTheme = BlTheme(mIsDarkTheme: mIsDarkTheme);

    return Container(
      alignment: Alignment.center,
      width: (mSize ?? 20),
      height: (mSize ?? 20),
      child: Center(
        child: LoadingIndicator(
          indicatorType: (mIndicator == null ? Indicator.ballBeat : mIndicator!),
          colors: [(mColor ?? mBlTheme.mColorAccent)],
        ),
      ),
    );
  }
}
