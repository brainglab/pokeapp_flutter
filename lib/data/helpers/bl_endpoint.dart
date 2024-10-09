/// Clase que define los endpoints y configuraciones para la API de Pokémon.
///
/// Esta clase contiene constantes estáticas que especifican los detalles
/// de conexión para la API de Pokémon. Incluye información como el esquema
/// de la URL, el host y el puerto utilizado para las solicitudes HTTP.
///
/// Propiedades:
/// - [mWebServiceScheme]: Define el esquema de la URL (http o https).
/// - [mWebServiceURL]: Especifica el host de la API de Pokémon.
/// - [mWebServicePort]: Indica el puerto utilizado para las conexiones.
///
/// Uso típico:
/// ```dart
/// final url = Uri(
///   scheme: BlEndpoint.mWebServiceScheme,
///   host: BlEndpoint.mWebServiceURL,
///   port: BlEndpoint.mWebServicePort,
///   path: '/api/v2/pokemon',
/// );
/// ```
///
/// Esta clase centraliza la configuración de la API, facilitando
/// cambios futuros en la URL o el puerto del servicio sin necesidad
/// de modificar múltiples archivos en la aplicación.
class BlEndpoint {
  // endpoint de la API de Pokémon
  static const String mWebServiceScheme = "https"; // http ó https
  static const String mWebServiceURL = "pokeapi.co";
  static const int mWebServicePort = 443; // 3000 - 443
}
