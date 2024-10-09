import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:pokeapp_flutter/presentation/helpers/text.dart';
import 'package:pokeapp_flutter/presentation/providers/pokemon_provider.dart';
import 'package:pokeapp_flutter/presentation/routes/route.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';
import 'package:pokeapp_flutter/presentation/widgets/bl_network_image.dart';

class PokemonCard extends ConsumerWidget {
  final dynamic pokemon;
  final BlTheme mBlTheme;

  const PokemonCard({super.key, required this.pokemon, required this.mBlTheme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
