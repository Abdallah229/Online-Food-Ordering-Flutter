/// Represents the current status of an asynchronous network or database request.
///
/// Used globally across the application's Presentation Layer (Cubits/BLoCs)
/// to dictate exactly what the UI should render at any given moment.
enum RequestState {
  /// The request hasn't started yet (e.g., the screen just opened).
  initial,

  /// The request is currently communicating with the API or Local Cache.
  /// The UI should display a loading indicator.
  loading,

  /// The request completed successfully and data is available.
  /// The UI should display the data.
  success,

  /// The request failed. The UI should display an error message.
  error,
}