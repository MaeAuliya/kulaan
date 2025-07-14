# KULAAN App

## Overview
KULAAN is a Flutter application designed to provide a seamless user experience for managing various features. This project includes authentication, home screen functionalities, and dependency injection for better state management.

## Project Structure
```
kulaan_apps
├── lib
│   ├── main.dart                     # Entry point of the application
│   └── src
│       ├── core
│       │   └── services
│       │       ├── dependency_injection
│       │       │   └── injection_container.dart  # Dependency injection setup
│       │       └── routers
│       │           └── router.dart  # Routing logic for navigation
│       └── features
│           └── auth
│               └── presentation
│                   └── screens
│                       └── login_screen.dart  # Login screen implementation
│           └── home
│               └── presentation
│                   ├── providers
│                   │   └── home_provider.dart  # HomeProvider for state management
│                   └── screens
│                       └── home_screen.dart  # Home screen implementation
├── pubspec.yaml                     # Project configuration and dependencies
└── README.md                        # Project documentation
```

## Setup Instructions
1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd kulaan_apps
   ```
3. Install the dependencies:
   ```
   flutter pub get
   ```
4. Run the application:
   ```
   flutter run
   ```

## Usage Guidelines
- The application starts with the login screen where users can enter their credentials.
- Upon successful login, users are redirected to the home screen.
- The app supports both light and dark themes, which can be toggled in the settings.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for any enhancements or bug fixes.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.