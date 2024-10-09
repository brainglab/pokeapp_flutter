import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/data/repositories/pokemon_repository_impl.dart';
import 'package:pokeapp_flutter/data/models/pokemon_model.dart';
import 'package:pokeapp_flutter/data/datasources/pokemons_data_source.dart';
import 'package:tuple/tuple.dart';

// Proveedor para el repositorio de Pokémon
final mPokemonRepositoryProvider = Provider<PokemonRepositoryImpl>((ref) {
  return PokemonRepositoryImpl(mPokemonDataSource: PokemonDataSourceImpl());
});

final mPokemonsParametersProvider = StateProvider<String>((ref) {
  return "";
});

// Proveedor para almacenar el ID del Pokémon seleccionado
final mSelectedPokemonIdProvider = StateProvider<String?>((ref) {
  return null;
});

// Comentario: Este proveedor almacena el ID del Pokémon seleccionado.
// Inicialmente es null y se puede actualizar cuando se selecciona un Pokémon.

// Proveedor para obtener la lista de Pokémon
final mPokemonsProvider = StateNotifierProvider<PokemonsNotifier, AsyncValue<Tuple2<List<PokemonModel>, String?>>>((ref) {
  return PokemonsNotifier(ref.watch(mPokemonRepositoryProvider));
});

// Notificador para la lista de Pokémon
class PokemonsNotifier extends StateNotifier<AsyncValue<Tuple2<List<PokemonModel>, String?>>> {
  final PokemonRepositoryImpl mRepository;
  List<PokemonModel> mPokemonList = [];

  PokemonsNotifier(this.mRepository) : super(const AsyncValue.loading()) {
    loadPokemons();
  }

  Future<void> loadPokemons() async {
    try {
      final mResult = await mRepository.getPokemons("");
      mPokemonList = mResult.item1;
      state = AsyncValue.data(Tuple2(mPokemonList, mResult.item2));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> loadMorePokemons(String mParameters) async {
    try {
      final mResult = await mRepository.getPokemons(mParameters);
      mPokemonList.addAll(mResult.item1);
      state = AsyncValue.data(Tuple2(mPokemonList, mResult.item2));
    } catch (e) {
      // En caso de error, mantenemos la lista actual y notificamos el error
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Proveedor para obtener un Pokémon por ID
final mPokemonByIdProvider = FutureProvider.autoDispose.family<PokemonModel, String>((ref, mId) async {
  final mRepository = ref.watch(mPokemonRepositoryProvider);
  return mRepository.getPokemonForId(mId);
});
