import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:pokeapp_flutter/presentation/helpers/text.dart';
import 'package:pokeapp_flutter/presentation/providers/pokemon_provider.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';
import 'package:pokeapp_flutter/presentation/routes/route.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';
import 'package:pokeapp_flutter/presentation/widgets/bl_network_image.dart';

/// PokemonCard es un widget personalizado que extiende ConsumerWidget para mostrar información de un Pokémon en forma de tarjeta.
///
/// Este widget está diseñado para ser utilizado en listas o grids de Pokémon, proporcionando una vista previa
/// concisa y atractiva de cada Pokémon.
///
/// Características principales:
/// - Muestra una imagen, nombre y otros detalles básicos del Pokémon.
/// - Utiliza Riverpod para acceder al estado global y al tema de la aplicación.
/// - Es interactivo, permitiendo navegar a una vista detallada del Pokémon al ser tocado.
/// - Se adapta automáticamente al tema claro/oscuro de la aplicación.
///
/// Parámetros:
/// - pokemon: Un objeto dinámico que contiene la información del Pokémon a mostrar.
///
/// Uso típico:
/// ```dart
/// PokemonCard(
///   pokemon: pokemonData,
/// )
/// ```
///
/// Este widget es ideal para crear interfaces de usuario consistentes y atractivas
/// para mostrar listas de Pokémon en la aplicación.
class PokemonCard extends ConsumerWidget {
  const PokemonCard({super.key, required this.pokemon});

  final dynamic pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mIsDarkTheme = ref.watch(mIsDarkThemeProvider);
    BlTheme mBlTheme = BlTheme(mIsDarkTheme: mIsDarkTheme);

    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: mBlTheme.mColorWhite,
      surfaceTintColor: mBlTheme.mColorWhite,
      child: InkWell(
        onTap: () {
          ref.read(mSelectedPokemonIdProvider.notifier).update((state) => pokemon.id.toString());
          navigate(context, RoutePage.detail);
        },
        borderRadius: BorderRadius.circular(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 10),
            SizedBox(
              width: 70,
              height: 70,
              child: BLNetworkImage(
                mUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon.id.toString()}.png',
                boxFit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      capitalizeText(pokemon.name ?? ''),
                      style: mBlTheme.mTextStyleBlackBold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Id ${pokemon.id}",
                      style: mBlTheme.mTextStyleGraySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 50,
              height: 70,
              child: Container(
                width: 40,
                height: double.infinity,
                alignment: Alignment.center,
                child: Icon(
                  TablerIcons.chevron_right,
                  color: mBlTheme.mColorDark,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
