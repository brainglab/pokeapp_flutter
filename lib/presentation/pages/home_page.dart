import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pokeapp_flutter/presentation/widgets/pokemon_card.dart';
import 'package:pokeapp_flutter/presentation/providers/pokemon_provider.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';
import 'package:pokeapp_flutter/presentation/widgets/custom_button.dart';
import 'package:pokeapp_flutter/presentation/widgets/loading.dart';
import 'package:pokeapp_flutter/presentation/widgets/navbar_back.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    bool mIsDarkTheme = ref.watch(mIsDarkThemeProvider);
    BlTheme mBlTheme = BlTheme(mIsDarkTheme: mIsDarkTheme);
    var mPokemonsProviderAsyncValue = ref.watch(mPokemonsProvider);

    // Comentario: Usamos AutoDispose para mantener el estado
    ref.listen(mPokemonsProvider, (_, __) {});

    return Scaffold(
      backgroundColor: mBlTheme.mColorBackgroundLayout,
      appBar: NavbarBack(
        mBackgroundColor: mBlTheme.mColorBackgroundLayout,
        mBackgroundButtonColor: mBlTheme.mColorBackgroundLayout,
        mTitle: "Pokemons",
        mShowBack: false,
        mShowMenu: false,
        mMenu: CustomButton(
          color: mBlTheme.mColorBackgroundLayout,
          borderRadius: 500,
          child: Icon(
            TablerIcons.reload,
            color: mBlTheme.mColorBlack,
            size: 22,
          ),
          callback: () {
            ref.read(mPokemonsProvider.notifier).clearPokemons();
          },
        ),
        mListActions: [
          CustomButton(
            color: Colors.transparent,
            width: 50,
            callback: () async {
              // Cambiar el valor de mColorBackgroundLayout
              ref.read(mIsDarkThemeProvider.notifier).update((state) => !state);
            },
            child: Icon(
              mIsDarkTheme ? TablerIcons.sun : TablerIcons.moon,
              color: mBlTheme.mColorAccent,
              size: 25,
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: RefreshIndicator(
          backgroundColor: mBlTheme.mColorAccent,
          color: mBlTheme.mColorLight,
          strokeWidth: 3,
          displacement: 80,
          onRefresh: () async {
            // Comentario: Refrescamos el proveedor de Pokémons y esperamos a que se complete
            await ref.refresh(mPokemonsProvider.notifier).loadPokemons();
          },
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1024),
              child: mPokemonsProviderAsyncValue.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
                data: (pokemons) {
                  return LazyLoadScrollView(
                    onEndOfPage: () {
                      // Implementación del scroll infinito
                      final mNextUrl = pokemons.item2;
                      if (mNextUrl != null && mNextUrl.isNotEmpty) {
                        ref.read(mPokemonsProvider.notifier).loadMorePokemons(mNextUrl);
                      }
                    },
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: 20),
                        if (pokemons.item1.isEmpty)
                          Container(
                            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                            width: double.infinity,
                            child: Text(
                              "No hay registros para mostrar",
                              style: mBlTheme.mTextStyleGrayBold,
                              textAlign: TextAlign.center,
                            ),
                          )
                        else
                          ...pokemons.item1.map((pokemon) => PokemonCard(pokemon: pokemon)),
                        // Indicador de carga al final de la lista
                        if (pokemons.item2 != null && pokemons.item2!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Loading(
                              mIndicator: Indicator.ballBeat,
                              mColor: mBlTheme.mColorAccent,
                              mSize: 30,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
