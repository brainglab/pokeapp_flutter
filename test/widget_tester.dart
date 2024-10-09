import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/presentation/widgets/pokemon_card.dart';
import 'package:pokeapp_flutter/presentation/themes/bl_theme.dart';

void main() {
  testWidgets('PokemonCard muestra información correcta', (WidgetTester tester) async {
    final mMockPokemon = {
      'id': 1,
      'name': 'bulbasaur',
    };

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: PokemonCard(
              pokemon: mMockPokemon,
              mBlTheme: BlTheme(mIsDarkTheme: false),
            ),
          ),
        ),
      ),
    );

    // Comentario: Verificamos que se muestre el nombre del Pokémon
    expect(find.text('Bulbasaur'), findsOneWidget);

    // Comentario: Verificamos que se muestre el ID del Pokémon
    expect(find.text('Id 1'), findsOneWidget);
  });
}
