# 🍔 Online Food Ordering System

A high-performance, scalable Flutter mobile application built using **Clean Architecture** and **Feature-First** modularity. This project demonstrates advanced state management, robust RESTful API integration, and persistent offline data handling.

## ✨ Features

### Business Features

* **Authentication Flow:** Secure user sign-up, login, and session management.
* **Menu Catalog:** Browse restaurant menus with paginated and lazy-loaded lists.
* **Cart Management:** Full CRUD capabilities (Create, Read, Update, Delete) for order management.
* **Order History:** View past orders with detailed receipt breakdowns.

### Technical Features

* **Clean Architecture:** Strict separation of Presentation, Domain, and Data layers.
* **State Management:** Predictable state transitions using `flutter_bloc` (Cubit).
* **API Integration:** Robust REST communication using `dio` with custom error interceptors.
* **Local Caching:** Offline-first data persistence using `hive` and `shared_preferences`.
* **Dependency Injection:** decoupled service locator pattern utilizing `get_it`.
* **Declarative Routing:** Systematic navigation handling via `go_router`.
* **Functional Error Handling:** Safe failure resolution using `dartz` (`Either<Failure, Success>`).
* **Environment Security:** API keys and Base URLs protected via `.env` configurations.

## 🛠️ Tech Stack

* **Framework:** Flutter (Dart)
* **State Management:** `flutter_bloc`, `equatable`
* **Network:** `dio`
* **Database/Storage:** `hive`, `hive_flutter`, `shared_preferences`
* **Routing:** `go_router`
* **Dependency Injection:** `get_it`
* **Utilities:** `dartz`, `flutter_dotenv`

## 📂 Project Architecture

The project strictly follows a Feature-First Clean Architecture approach.

```text
lib/
├── core/                                # Shared app-wide resources
│   ├── constants/
│   │   ├── api_constants.dart           # Base URLs and endpoint paths
│   │   └── app_constants.dart           # Generic numeric/string constants
│   ├── enums/
│   │   └── request_state.dart           # Enums for loading/success/error states
│   ├── errors/
│   │   ├── exceptions.dart              # Server and Cache exceptions
│   │   ├── failures.dart                # Domain-level Failure classes
│   │   └── error_message_model.dart     # API error parsing model
│   ├── network/
│   │   ├── api_consumer.dart            # Abstract network contract
│   │   ├── dio_consumer.dart            # Dio implementation of ApiConsumer
│   │   ├── error_interceptor.dart       # Dio interceptor for global error handling
│   │   └── network_info.dart            # Connectivity checker
│   ├── routing/
│   │   ├── app_router.dart              # GoRouter configuration
│   │   └── routes.dart                  # String constants for route names
│   ├── theming/
│   │   ├── colors.dart                  # App color palette
│   │   ├── themes.dart                  # ThemeData for light/dark mode
│   │   └── app_typography.dart          # Text styles
│   ├── utils/
│   │   ├── app_strings.dart             # Hardcoded UI strings
│   │   ├── validators.dart              # Regex and input validation logic
│   │   └── logger.dart                  # Custom print/logging utility
│   └── widgets/
│       ├── custom_button.dart           # Reusable elevated button
│       ├── custom_text_field.dart       # Reusable input field
│       ├── loading_indicator.dart       # Standardized spinner
│       └── error_screen.dart            # Reusable error UI
├── features/                            # Feature modules
│   ├── auth/
│   │   ├── data/                        # Models, Data Sources, Repositories Impl
│   │   ├── domain/                      # Entities, Use Cases, Repositories Contracts
│   │   └── presentation/                # BLoCs, Pages, Widgets
│   ├── cart/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── menu/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── injection_container.dart             # GetIt service locator setup
└── main.dart                            # App entry point

```

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (`^3.11.0`)
* Dart SDK

### Installation

1. Clone the repository:

```bash
git clone <your-repository-url>

```

1. Create a `.env` file in the root directory and add your API URLs:

```env
BASE_URL=[https://dummyjson.com](https://dummyjson.com)

```

1. Fetch dependencies:

```bash
flutter pub get

```

1. Run code generation (for Hive adapters and injectables if applicable):

```bash
flutter pub run build_runner build --delete-conflicting-outputs

```

1. Run the app:

```bash
flutter run

```
