import 'package:equatable/equatable.dart';

/// A data model responsible for parsing structured error responses directly
/// from the backend API (e.g., when the server returns a 400 or 500 status code).
///
/// This acts as a bridge between raw JSON maps and our Dart application.
/// It extends [Equatable] so that identical server errors can be compared
/// by value rather than by memory reference, which is crucial for BLoC state testing.
class ErrorMessageModel extends Equatable {
  /// The specific error text provided by the backend, intended to explain
  /// why the request failed (e.g., "Invalid email format" or "Product out of stock").
  final String message;

  /// Creates an [ErrorMessageModel] with a required [message].
  const ErrorMessageModel(this.message);

  /// Safely constructs an [ErrorMessageModel] from a raw JSON map.
  ///
  /// It looks for the `'message'` key in the JSON payload. If the key is missing,
  /// null, or of the wrong type, it provides a safe fallback string to prevent
  /// the app from crashing due to a `TypeError`.
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        json['message'] as String? ?? 'An unknown error occurred.',
      );

  @override
  List<Object?> get props => [message];
}