import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:pokeapp_flutter/presentation/pages/home_page.dart';
import 'package:pokeapp_flutter/presentation/providers/pokemon_provider.dart';
import 'package:pokeapp_flutter/presentation/providers/theme_provider.dart';

// Comentario: Creamos un mock del PokemonNotifier
class MockPokemonNotifier extends Mock implements PokemonsNotifier {}

void main() {
  late MockPokemonNotifier mMockPokemonNotifier;

  setUp(() {
    mMockPokemonNotifier = MockPokemonNotifier();
  });

  testWidgets('HomePage muestra lista de Pokémon', (WidgetTester tester) async {
    // Comentario: Configuramos el mock para devolver una lista de Pokémon
    when(mMockPokemonNotifier.loadPokemons()).thenAnswer((_) async => ([], null));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          mPokemonsProvider.overrideWith((ref) => mMockPokemonNotifier),
          isDarkThemeProvider.overrideWith((ref) => false),
        ],
        child: const MaterialApp(home: HomePage()),
      ),
    );

    // Comentario: Verificamos que se muestre el título "Pokemons"
    expect(find.text('Pokemons'), findsOneWidget);

    // Comentario: Verificamos que se llame a loadPokemons
    verify(mMockPokemonNotifier.loadPokemons()).called(1);
  });
}
