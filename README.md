# Flutter Phone Authentication App

## Overview
A three-page mobile application built with Flutter and Firebase, demonstrating proficiency in UI/UX design, state management (BLoC), and integration of web and native functionalities.

## Features
- **Phone Number Authentication**: Secure login using phone number verification
- **OTP Verification**: One-time password verification through Firebase
- **Web View Integration**: Interactive web view that adjusts layout based on keyboard presence

## Screenshots
[Add screenshots here]

## Technologies Used
- Flutter (latest version)
- Firebase Authentication
- BLoC State Management
- WebView Flutter

## Project Structure
```
lib/
├── blocs/            # BLoC related files
│   ├── auth/         # Authentication BLoCs
│   └── webview/      # WebView BLoCs
├── models/           # Data models
├── repositories/     # Data repositories
├── screens/          # UI screens
├── services/         # Firebase and other services
└── widgets/          # Reusable UI components
```

## Getting Started

### Prerequisites
- Flutter SDK (latest version)
- Dart SDK (latest version)
- Firebase project setup
- Android Studio / VS Code

### Installation
1. Clone the repository:
   ```
   git clone https://github.com/Rabeeheee/WebView.git
   ```

2. Navigate to project directory:
   ```
   cd WebView
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Configure Firebase:
   - Create a new Firebase project
   - Add Android/iOS apps to the project
   - Download and add the `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) files
   - Follow the Firebase setup instructions

5. Run the app:
   ```
   flutter run
   ```

## Features Implementation Details

### Page 1: Enter Phone Number
- User inputs phone number
- Validation for correct format
- Sends verification code via Firebase

### Page 2: OTP Verification
- User enters the OTP received
- Firebase verifies the OTP
- Navigates to web view upon successful verification

### Page 3: Web View
- Displays https://flutter.dev/showcase
- Adjusts layout based on keyboard presence
- Maintains smooth interaction between web view and native keyboard

## State Management
This project uses BLoC (Business Logic Component) pattern for state management. The BLoC pattern separates business logic from UI, making the code more maintainable and testable.

## Firebase Integration
- Phone authentication using Firebase Auth
- Secure OTP verification

## Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License
[Add your license here]

## Acknowledgments
- Flutter team for the amazing framework
- Firebase for authentication services
![WhatsApp Image 2025-05-07 at 15 12 13_a636735f](https://github.com/user-attachments/assets/3113a709-1f4f-4393-8f55-a491b0ce15aa)
![2](https://github.com/user-attachments/assets/69e0c20a-8900-4e28-9f6e-f0b2631c2a56)
![3](https://github.com/user-attachments/assets/45d6269c-23ff-42ff-b98e-c28eb2d79477)
