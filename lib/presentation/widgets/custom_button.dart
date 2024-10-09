import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';

class CustomButton extends ConsumerWidget {
  const CustomButton({
    super.key,
    this.color,
    this.borderColor,
    this.callback,
    this.height,
    this.width,
    this.elevation,
    this.borderRadius,
    this.marginTop,
    this.marginBottom,
    this.child,
    this.alignmentChild,
  });

  final Color? color;
  final Color? borderColor;
  final VoidCallback? callback;
  final double? height;
  final double? width;
  final double? elevation;
  final double? borderRadius;
  final double? marginTop;
  final double? marginBottom;
  final Widget? child;
  final Alignment? alignmentChild;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mIsDarkTheme = ref.watch(isDarkThemeProvider);
    BlTheme mBlTheme = BlTheme(mIsDarkTheme: mIsDarkTheme);

    return Container(
      height: (height ?? 48),
      width: width,
      margin: EdgeInsets.only(top: marginTop ?? 0, bottom: marginBottom ?? 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius == null ? mBlTheme.mRadius : borderRadius!),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              offset: Offset(1, (elevation == null ? 1 : elevation!)), //(x,y)
              blurRadius: (elevation == null ? 1 : elevation!),
            ),
          ],
          border: Border.all(color: borderColor == null ? color! : borderColor!)),
      child: MaterialButton(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius == null ? mBlTheme.mRadius : borderRadius!),
          ),
          onPressed: callback,
          child: Align(alignment: (alignmentChild == null ? Alignment.center : alignmentChild!), child: child)),
    );
  }
}
