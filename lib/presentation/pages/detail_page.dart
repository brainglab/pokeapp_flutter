import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pokeapp_flutter/presentation/providers/pokemon_provider.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';
import 'package:pokeapp_flutter/presentation/widgets/navbar_back.dart';
import 'package:pokeapp_flutter/presentation/widgets/bl_network_image.dart';
import 'package:pokeapp_flutter/presentation/helpers/text.dart';
import 'package:pokeapp_flutter/presentation/widgets/loading.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mIsDarkTheme = ref.watch(mIsDarkThemeProvider);
    BlTheme mBlTheme = BlTheme(mIsDarkTheme: mIsDarkTheme);

    // Comentario: Asumimos que el ID del Pokémon se pasa como argumento
    final mPokemonId = ref.watch(mSelectedPokemonIdProvider);
    final mPokemonAsyncValue = ref.watch(mPokemonByIdProvider(mPokemonId!));

    return Scaffold(
      backgroundColor: mBlTheme.mColorBackgroundLayout,
      appBar: NavbarBack(
        mBackgroundColor: Colors.transparent,
        mBackgroundButtonColor: mBlTheme.mColorBackgroundLayout,
        mShowBack: true,
        mTitle: "Detalle",
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: RefreshIndicator(
          backgroundColor: mBlTheme.mColorWhite,
          color: mBlTheme.mColorAccent,
          strokeWidth: 3,
          displacement: 80,
          onRefresh: () async {
            // Comentario: Refrescamos el proveedor del Pokémon actual
            return ref.refresh(mPokemonByIdProvider(mPokemonId));
          },
          child: mPokemonAsyncValue.when(
            loading: () => Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 300,
              color: mBlTheme.mColorBackgroundLayout,
              child: Center(
                child: Loading(
                  mIndicator: Indicator.ballBeat,
                  mColor: mBlTheme.mColorAccent,
                ),
              ),
            ),
            error: (error, stack) => Center(child: Text('Error: $error')),
            data: (mPokemon) => Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 300,
                      child: Card(
                        elevation: 5,
                        color: mBlTheme.mColorWhite,
                        margin: const EdgeInsets.all(3),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: BLNetworkImage(
                            mUrl: mPokemon.sprites?.other?.officialArtwork?.frontDefault ?? '/PokeAPI/sprites/master/sprites/pokemon/${mPokemon.id.toString()}.png',
                            boxFit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      child: RichText(
                        textAlign: TextAlign.center,
                        maxLines: 100,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: capitalizeText(mPokemon.name ?? ''),
                              style: mBlTheme.mTextStyleBlackTitle,
                            ),
                            TextSpan(
                              text: ' (Id ',
                              style: mBlTheme.mTextStyleGray,
                            ),
                            TextSpan(
                              text: capitalizeText(mPokemon.id?.toString() ?? ''),
                              style: mBlTheme.mTextStyleGray,
                            ),
                            TextSpan(
                              text: ')',
                              style: mBlTheme.mTextStyleGray,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Tipos
                    Card(
                      elevation: 1,
                      color: mBlTheme.mColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(mBlTheme.mRadius),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Comentario: Aquí deberías implementar la navegación a la página "Acerca de"
                        },
                        borderRadius: BorderRadius.circular(mBlTheme.mRadius),
                        child: Container(
                          padding: EdgeInsets.only(left: mBlTheme.mPadding / 2, right: 1),
                          child: ListTile(
                            leading: Container(
                              width: 20,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.info_outline,
                                size: 20,
                                color: mBlTheme.mColorDark,
                              ),
                            ),
                            title: Container(
                              padding: EdgeInsets.symmetric(vertical: mBlTheme.mPadding / 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Tipos",
                                    style: mBlTheme.mTextStyleBlackBoldSmall,
                                  ),
                                  Text(
                                    mPokemon.types?.map((type) => capitalizeText(type.type?.name ?? '')).join(', ') ?? 'Desconocido',
                                    style: mBlTheme.mTextStyleGray,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // peso
                    Card(
                      elevation: 1,
                      color: mBlTheme.mColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(mBlTheme.mRadius),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Comentario: Aquí deberías implementar la navegación a la página "Acerca de"
                        },
                        borderRadius: BorderRadius.circular(mBlTheme.mRadius),
                        child: Container(
                          padding: EdgeInsets.only(left: mBlTheme.mPadding / 2, right: 1),
                          child: ListTile(
                            leading: Container(
                              width: 20,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.info_outline,
                                size: 20,
                                color: mBlTheme.mColorDark,
                              ),
                            ),
                            title: Container(
                              padding: EdgeInsets.symmetric(vertical: mBlTheme.mPadding / 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Peso",
                                    style: mBlTheme.mTextStyleBlackBoldSmall,
                                  ),
                                  Text(
                                    "${(mPokemon.weight ?? 0) / 10} kg",
                                    style: mBlTheme.mTextStyleGray,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // altura
                    Card(
                      elevation: 1,
                      color: mBlTheme.mColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(mBlTheme.mRadius),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Comentario: Aquí deberías implementar la navegación a la página "Acerca de"
                        },
                        borderRadius: BorderRadius.circular(mBlTheme.mRadius),
                        child: Container(
                          padding: EdgeInsets.only(left: mBlTheme.mPadding / 2, right: 1),
                          child: ListTile(
                            leading: Container(
                              width: 20,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.info_outline,
                                size: 20,
                                color: mBlTheme.mColorDark,
                              ),
                            ),
                            title: Container(
                              padding: EdgeInsets.symmetric(vertical: mBlTheme.mPadding / 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Altura",
                                    style: mBlTheme.mTextStyleBlackBoldSmall,
                                  ),
                                  Text(
                                    "${(mPokemon.height ?? 0) / 10} m",
                                    style: mBlTheme.mTextStyleGray,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // habilidades
                    Card(
                      elevation: 1,
                      color: mBlTheme.mColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(mBlTheme.mRadius),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Comentario: Aquí deberías implementar la navegación a la página "Acerca de"
                        },
                        borderRadius: BorderRadius.circular(mBlTheme.mRadius),
                        child: Container(
                          padding: EdgeInsets.only(left: mBlTheme.mPadding / 2, right: 1),
                          child: ListTile(
                            leading: Container(
                              width: 20,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.info_outline,
                                size: 20,
                                color: mBlTheme.mColorDark,
                              ),
                            ),
                            title: Container(
                              padding: EdgeInsets.symmetric(vertical: mBlTheme.mPadding / 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Habilidades",
                                    style: mBlTheme.mTextStyleBlackBoldSmall,
                                  ),
                                  Text(
                                    mPokemon.abilities?.map((mAbility) => capitalizeText(mAbility.ability!.name ?? '')).join(', ') ?? 'Sin habilidades',
                                    style: mBlTheme.mTextStyleGray,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Estadisticas base
                    Card(
                      elevation: 1,
                      color: mBlTheme.mColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(mBlTheme.mRadius),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Comentario: Aquí deberías implementar la navegación a la página "Acerca de"
                        },
                        borderRadius: BorderRadius.circular(mBlTheme.mRadius),
                        child: Container(
                          padding: EdgeInsets.only(left: mBlTheme.mPadding / 2, right: 1),
                          child: ListTile(
                            leading: Container(
                              width: 20,
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.info_outline,
                                size: 20,
                                color: mBlTheme.mColorDark,
                              ),
                            ),
                            title: Container(
                              padding: EdgeInsets.symmetric(vertical: mBlTheme.mPadding / 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Estadisticas base",
                                    style: mBlTheme.mTextStyleBlackBoldSmall,
                                  ),
                                  Text(
                                    mPokemon.stats?.map((mStat) => '${capitalizeText(mStat.stat?.name ?? '')}: ${mStat.baseStat}').join(', ') ?? 'Sin estadísticas base',
                                    style: mBlTheme.mTextStyleGray,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
