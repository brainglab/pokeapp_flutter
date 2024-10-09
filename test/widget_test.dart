import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapp_flutter/domain/entities/pokemon.dart';
import 'package:pokeapp_flutter/presentation/helpers/text.dart';
import 'package:pokeapp_flutter/presentation/widgets/pokemon_card.dart';

void main() {
  testWidgets('PokemonCard muestra información correcta', (WidgetTester tester) async {
    final mMockPokemon = Pokemon();
    mMockPokemon.id = 1;
    mMockPokemon.name = 'bulbasaur';

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: PokemonCard(pokemon: mMockPokemon),
        ),
      ),
    );

    // Comentario: Verificamos que se muestre el nombre del Pokémon
    expect(find.text(capitalizeText('bulbasaur')), findsOneWidget);

    // Comentario: Verificamos que se muestre el ID del Pokémon
    expect(find.text('Id 1'), findsOneWidget);
  });
}
