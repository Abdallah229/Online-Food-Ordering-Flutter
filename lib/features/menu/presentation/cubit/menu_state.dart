import 'package:equatable/equatable.dart';
import 'package:food_ordering_system/core/enums/request_state.dart';
import 'package:food_ordering_system/features/menu/domain/entities/product.dart';

/// The unified state object for the Menu feature.
///
/// Instead of creating multiple classes (like MenuLoadingState, MenuLoadedState),
/// we use a single state class combined with the [RequestState] enum.
/// This is crucial for features like "Infinite Scrolling/Pagination", because
/// it allows us to emit a `loading` status to fetch page 2, WITHOUT losing
/// the `products` list we already loaded from page 1!
class MenuState extends Equatable {
  /// The current list of loaded menu items.
  final List<Product> products;

  /// The current execution status of the Cubit's operations.
  final RequestState status;

  /// A human-readable error message, populated only if status is [RequestState.error].
  final String errorMessage;

  /// Flag to indicate if the backend has run out of products to fetch.
  /// If true, the UI should stop showing the pagination loading spinner.
  final bool hasReachedMax;

  /// Constructor with sensible defaults so the initial state is completely clean.
  const MenuState({
    this.products = const [],
    this.status = RequestState.initial,
    this.errorMessage = '',
    this.hasReachedMax = false,
  });

  /// Creates a new instance of the state by copying existing values and
  /// overriding only the specific fields passed in.
  MenuState copyWith({
    List<Product>? products,
    RequestState? status,
    String? errorMessage,
    bool? hasReachedMax,
  }) {
    return MenuState(
      products: products ?? this.products,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [products, status, errorMessage, hasReachedMax];
}