/// The central contract for all external network communications.
///
/// By depending on this abstract [ApiConsumer] interface rather than a concrete 
/// implementation (like the Dio package), the Data Layer (Remote Data Sources) 
/// remains completely decoupled from third-party networking libraries. 
/// 
/// If the underlying HTTP client ever needs to be swapped (e.g., from Dio to `http`), 
/// only the implementation class needs to change; the Repositories and Data 
/// Sources will remain untouched.
abstract class ApiConsumer {
  /// Sends an HTTP GET request to the specified [path] to retrieve data.
  ///
  /// Optional [queryParameters] can be provided to filter or paginate the 
  /// results (e.g., `?page=1&limit=10`).
  /// 
  /// Returns a `Future<dynamic>` containing the parsed JSON response body.
  Future<dynamic> get(
      String path, {
        Map<String, dynamic>? queryParameters,
      });

  /// Sends an HTTP POST request to the specified [path] to create new resources.
  ///
  /// The [data] parameter holds the payload (usually a JSON Map) to send.
  /// If [isFormData] is explicitly set to `true`, the implementation should 
  /// convert the [data] into a Multipart/Form-Data object (useful for file 
  /// or image uploads). Optional [queryParameters] can also be attached.
  /// 
  /// Returns a `Future<dynamic>` containing the parsed JSON response body.
  Future<dynamic> post(
      String path, {
        dynamic data,
        bool isFormData = false,
        Map<String, dynamic>? queryParameters,
      });

  /// Sends an HTTP PUT request to the specified [path] to update an existing resource.
  ///
  /// Similar to `post`, it accepts [data] for the updated payload, an [isFormData] 
  /// flag for multipart requests, and optional [queryParameters].
  /// 
  /// Returns a `Future<dynamic>` containing the parsed JSON response body.
  Future<dynamic> put(
      String path, {
        dynamic data,
        bool isFormData = false,
        Map<String, dynamic>? queryParameters,
      });

  /// Sends an HTTP DELETE request to the specified [path] to remove a resource.
  ///
  /// It can optionally accept [data] (though rare for DELETE requests) and 
  /// [queryParameters].
  /// 
  /// Returns a `Future<dynamic>` containing the parsed JSON response body 
  /// (if the server returns content upon deletion).
  Future<dynamic> delete(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
      });
}