import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/data/repositories/pokemon_repository_impl.dart';
import 'package:pokeapp_flutter/data/models/pokemon_model.dart';
import 'package:pokeapp_flutter/data/datasources/pokemons_data_source.dart';
import 'package:pokeapp_flutter/presentation/helpers/toast.dart';
import 'package:tuple/tuple.dart';

/// Proveedor para el repositorio de Pokémon.
///
/// Este proveedor utiliza [Provider] de Riverpod para crear y proporcionar
/// una instancia única de [PokemonRepositoryImpl] en toda la aplicación.
///
/// Características principales:
/// - Crea una instancia de [PokemonRepositoryImpl] de forma perezosa.
/// - Garantiza una única instancia del repositorio en toda la aplicación.
/// - Facilita la inyección de dependencias y mejora la capacidad de prueba.
///
/// Uso típico:
/// ```dart
/// final mRepositorio = ref.watch(mPokemonRepositoryProvider);
/// ```
///
/// Beneficios:
/// 1. Centraliza la creación del repositorio, evitando duplicación de código.
/// 2. Permite cambiar fácilmente la implementación del repositorio si es necesario.
/// 3. Facilita el acceso al repositorio desde cualquier parte de la aplicación.
/// 4. Mejora la modularidad y mantenibilidad del código.
/// 5. Simplifica la implementación de pruebas unitarias y de integración.
///
/// @param ref El [ProviderRef] proporcionado automáticamente por Riverpod.
/// @return Una instancia de [PokemonRepositoryImpl] configurada con [PokemonDataSourceImpl].
final mPokemonRepositoryProvider = Provider<PokemonRepositoryImpl>((ref) {
  return PokemonRepositoryImpl(mPokemonDataSource: PokemonDataSourceImpl());
});

/// Proveedor para almacenar y gestionar los parámetros de búsqueda de Pokémon.
///
/// Este proveedor utiliza [StateProvider] de Riverpod para crear un estado mutable
/// que almacena una cadena de texto representando los parámetros de búsqueda actuales.
///
/// Características principales:
/// - Mantiene un estado de tipo String para los parámetros de búsqueda.
/// - Permite la actualización dinámica de los parámetros desde cualquier parte de la aplicación.
/// - Facilita la implementación de filtros y búsquedas en la lista de Pokémon.
///
/// Uso típico:
/// ```dart
/// // Leer los parámetros actuales
/// final mParametros = ref.watch(mPokemonsParametersProvider);
///
/// // Actualizar los parámetros
/// ref.read(mPokemonsParametersProvider.notifier).state = "nuevoParametro";
/// ```
///
/// Beneficios:
/// 1. Centraliza la gestión de los parámetros de búsqueda para Pokémon.
/// 2. Permite una fácil integración con widgets de búsqueda y filtrado.
/// 3. Facilita la implementación de búsquedas dinámicas y en tiempo real.
/// 4. Mejora la reactividad de la interfaz de usuario al cambiar los parámetros de búsqueda.
/// 5. Simplifica la implementación de funciones avanzadas de filtrado y ordenación.
///
/// Este proveedor es esencial para implementar funcionalidades de búsqueda y filtrado
/// en la aplicación, permitiendo una experiencia de usuario más interactiva y personalizada.
/// Además, facilita la implementación de características como historial de búsquedas
/// y sugerencias basadas en búsquedas anteriores.
final mPokemonsParametersProvider = StateProvider<String>((ref) {
  return "";
});

/// Proveedor para almacenar el ID del Pokémon seleccionado.
///
/// Este proveedor utiliza [StateProvider] de Riverpod para crear un estado mutable
/// que almacena el ID del Pokémon actualmente seleccionado en la aplicación.
///
/// Características principales:
/// - Mantiene un estado de tipo String? (String nullable) para el ID del Pokémon.
/// - Permite la actualización dinámica del ID seleccionado desde cualquier parte de la aplicación.
/// - Inicialmente, el valor es null, indicando que no hay ningún Pokémon seleccionado.
///
/// Uso típico:
/// ```dart
/// // Leer el ID del Pokémon seleccionado
/// final mSelectedId = ref.watch(mSelectedPokemonIdProvider);
///
/// // Actualizar el ID seleccionado
/// ref.read(mSelectedPokemonIdProvider.notifier).state = "25"; // Por ejemplo, para seleccionar a Pikachu
/// ```
///
/// Beneficios:
/// 1. Centraliza la gestión del Pokémon seleccionado en toda la aplicación.
/// 2. Facilita la implementación de funcionalidades como la visualización de detalles de un Pokémon.
/// 3. Permite una fácil sincronización entre diferentes partes de la UI que dependen del Pokémon seleccionado.
/// 4. Mejora la eficiencia al evitar múltiples solicitudes de datos para el mismo Pokémon.
/// 5. Simplifica la implementación de funciones como "favoritos" o "últimos vistos".
///
/// Este proveedor es esencial para implementar la navegación y la visualización de detalles
/// de Pokémon específicos, mejorando la interactividad y la experiencia del usuario en la aplicación.
/// Además, facilita la implementación de características avanzadas como el seguimiento del historial
/// de Pokémon vistos o la persistencia de selecciones entre sesiones de usuario.
final mSelectedPokemonIdProvider = StateProvider<String?>((ref) {
  return null;
});

/// Proveedor para obtener y gestionar la lista de Pokémon.
///
/// Este proveedor utiliza [StateNotifierProvider] de Riverpod para manejar el estado
/// de la lista de Pokémon de forma asíncrona y reactiva.
///
/// Características principales:
/// - Utiliza [PokemonsNotifier] como notificador de estado.
/// - Retorna un [AsyncValue] que contiene:
///   - Una tupla [Tuple2] con una lista de [PokemonModel] y un String opcional.
/// - Permite la carga inicial, actualización dinámica y paginación de la lista de Pokémon.
///
/// Uso típico:
/// ```dart
/// final mPokemonsState = ref.watch(mPokemonsProvider);
/// mPokemonsState.when(
///   data: (mData) {
///     final mPokemonList = mData.item1;
///     final mNextPageToken = mData.item2;
///     // Usar mPokemonList y mNextPageToken
///   },
///   loading: () => const CircularProgressIndicator(),
///   error: (mError, mStack) => Text('Error: $mError'),
/// );
/// ```
///
/// Beneficios:
/// 1. Centraliza la gestión del estado de la lista de Pokémon.
/// 2. Facilita la implementación de carga infinita y paginación.
/// 3. Permite una integración sencilla con widgets que dependen de la lista de Pokémon.
/// 4. Mejora la eficiencia en la carga y actualización de datos.
///
/// Este proveedor es esencial para la funcionalidad principal de la aplicación,
/// ofreciendo una gestión robusta y eficiente de la lista de Pokémon.
final mPokemonsProvider = StateNotifierProvider<PokemonsNotifier, AsyncValue<Tuple2<List<PokemonModel>, String?>>>((ref) {
  return PokemonsNotifier(ref.watch(mPokemonRepositoryProvider));
});

/// Notificador para gestionar el estado de la lista de Pokémon.
///
/// Esta clase extiende [StateNotifier] y maneja el estado asíncrono de una lista de Pokémon
/// junto con información adicional (como un token de paginación).
///
/// Características principales:
/// - Mantiene un estado de tipo [AsyncValue<Tuple2<List<PokemonModel>, String?>>].
/// - La lista de Pokémon se almacena como [List<PokemonModel>].
/// - El String opcional se usa para almacenar información de paginación.
///
/// Funcionalidades:
/// - Carga inicial de Pokémon.
/// - Carga de más Pokémon (paginación).
/// - Limpieza y recarga de la lista de Pokémon.
/// - Manejo de errores durante la carga.
///
/// El estado se actualiza de forma asíncrona, permitiendo mostrar estados de carga,
/// error o datos según corresponda en la interfaz de usuario.
///
/// Uso típico:
/// ```dart
/// final mNotifier = PokemonsNotifier(mRepository);
/// mNotifier.loadPokemons(); // Carga inicial
/// mNotifier.loadMorePokemons(mNextPageToken); // Cargar más Pokémon
/// mNotifier.clearPokemons(); // Limpiar y recargar la lista
/// ```
///
/// Esta clase es crucial para la gestión eficiente de la lista de Pokémon en la aplicación,
/// proporcionando una forma robusta de manejar datos asíncronos y actualizaciones de estado.
/// Además, incluye manejo de errores y notificaciones al usuario mediante customShowToast.
class PokemonsNotifier extends StateNotifier<AsyncValue<Tuple2<List<PokemonModel>, String?>>> {
  final PokemonRepositoryImpl mRepository;
  List<PokemonModel> mPokemonList = [];

  PokemonsNotifier(this.mRepository) : super(const AsyncValue.loading()) {
    loadPokemons();
  }

  clearPokemons() {
    mPokemonList = [];
    state = const AsyncValue.loading();
    loadPokemons();
  }

  Future<void> loadPokemons() async {
    try {
      final mResult = await mRepository.getPokemons("");

      if (mResult.item1 == false) {
        customShowToast("No se fue posible cargar los Pokemones");
      }

      mPokemonList = mResult.item2;
      state = AsyncValue.data(Tuple2(mPokemonList, mResult.item3));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> loadMorePokemons(String mParameters) async {
    try {
      final mResult = await mRepository.getPokemons(mParameters);

      if (mResult.item1 == false) {
        customShowToast("No se fue posible cargar más Pokemones");
      }

      mPokemonList.addAll(mResult.item2);
      state = AsyncValue.data(Tuple2(mPokemonList, mResult.item3));
    } catch (e) {
      // En caso de error, mantenemos la lista actual y notificamos el error
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

/// Proveedor para obtener un Pokémon específico por su ID.
///
/// Este proveedor utiliza [FutureProvider.autoDispose.family] de Riverpod para crear
/// un proveedor que puede ser parametrizado con el ID de un Pokémon y devuelve un
/// [Future] con los datos del Pokémon solicitado.
///
/// Características principales:
/// - Utiliza `autoDispose` para liberar recursos cuando el proveedor ya no se usa.
/// - Es un proveedor de tipo `family`, lo que permite parametrizarlo con el ID del Pokémon.
/// - Retorna un [PokemonModel] con los datos completos del Pokémon solicitado.
///
/// Funcionamiento:
/// 1. Recibe el ID del Pokémon como parámetro.
/// 2. Accede al repositorio de Pokémon a través de [mPokemonRepositoryProvider].
/// 3. Llama al método `getPokemonForId` del repositorio para obtener los datos del Pokémon.
/// 4. Devuelve un [Future] que se resolverá con el [PokemonModel] del Pokémon solicitado.
///
/// Uso típico:
/// ```dart
/// final pokemonAsyncValue = ref.watch(mPokemonByIdProvider('25')); // Para obtener datos de Pikachu
/// ```
///
/// Beneficios:
/// 1. Permite cargar datos de Pokémon individuales de forma asíncrona y eficiente.
/// 2. Facilita la implementación de vistas detalladas de Pokémon.
/// 3. Maneja automáticamente la caché y la liberación de recursos.
///
/// Este proveedor es esencial para mostrar información detallada de Pokémon individuales
/// en la aplicación, optimizando el rendimiento y la gestión de recursos.
final mPokemonByIdProvider = FutureProvider.autoDispose.family<PokemonModel, String>((ref, mId) async {
  final mRepository = ref.watch(mPokemonRepositoryProvider);
  final mResult = await mRepository.getPokemonForId(mId);
  if (mResult.item1 == false) {
    customShowToast("No se encontró el Pokémon");
  }
  return mResult.item2;
});
