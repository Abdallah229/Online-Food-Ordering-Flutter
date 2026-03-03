import 'package:food_ordering_system/core/errors/error_message_model.dart';

/// Exception thrown when the remote server returns an error status code
/// (e.g., 400 Bad Request, 404 Not Found, 500 Internal Server Error).
///
/// It carries the [errorModel], which contains the specific error message
/// parsed from the server's JSON response. This allows the Data Layer to pass
/// exact backend feedback up to the Domain Layer.
class ServerException implements Exception {
  final ErrorMessageModel errorModel;

  ServerException({required this.errorModel});
}

/// Exception thrown when a local database operation fails.
///
/// This will be utilized by the LocalDataSource when Hive or SharedPreferences
/// fails to read or write cached data (e.g., failing to save offline menu items).
class CacheException implements Exception {
  // TODO: Implement later when configuring hive.
}

/// Exception thrown when the device cannot successfully communicate with the server.
///
/// This occurs during connection timeouts, receive timeouts, or when
/// the device has no active internet connection, preventing the API call
/// from completing.
class NetworkException implements Exception {}