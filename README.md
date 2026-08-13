# Flutter Minimal Social Media App

A lightweight Flutter application demonstrating core social media features including user authentication, post creation, user profiles, and Firebase integration.

## 📋 Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Firebase Setup](#firebase-setup)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Building & Deployment](#building--deployment)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- **User Authentication**
  - Register new user accounts
  - Login with email and password
  - Secure logout functionality
  - Firebase Authentication integration

- **Social Features**
  - Create and post messages to the wall
  - View all posts from users
  - User profile viewing
  - Browse other users
  - User discovery

- **User Interface**
  - Clean Material Design
  - Light and dark mode support
  - Navigation drawer for easy access
  - Responsive layout

- **Backend**
  - Firebase Authentication for user management
  - Cloud Firestore for data storage
  - Real-time data updates with StreamBuilder

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (version 3.12.2 or higher)
- **Dart SDK** (included with Flutter)
- **Android Studio** or **Xcode** (for Android/iOS development)
- **Firebase Account** (for backend services)
- **Git** (version control)

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/FAHIMSHAKIL102/flutter_minimal_social_media_app.git
cd flutter_minimal_social_media_app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Get Flutter Doctor Check

Ensure your Flutter environment is properly set up:

```bash
flutter doctor
```

All checks should pass (except you may skip web/Windows desktop if not needed).

## 🔥 Firebase Setup

### 1. Create a Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Create a new project"
3. Enter a project name and follow the setup wizard

### 2. Configure Android

1. In Firebase Console, select your project
2. Click "Add app" → Select "Android"
3. Enter your package name: `com.example.flutter_minimal_social_media_app`
4. Download `google-services.json`
5. Place the file in `android/app/` directory

### 3. Configure iOS (Optional)

1. In Firebase Console, click "Add app" → Select "iOS"
2. Enter your iOS bundle ID
3. Download `GoogleService-Info.plist`
4. Open `ios/Runner.xcworkspace` in Xcode
5. Add the plist file to the Runner project

### 4. Enable Authentication

1. Go to **Authentication** in Firebase Console
2. Click **Sign-in method**
3. Enable **Email/Password** authentication

### 5. Create Firestore Database

1. Go to **Firestore Database**
2. Click **Create database**
3. Start in **production mode** (or test mode for development)
4. Create the following collections:
   - `Users` - for storing user profiles
   - `Posts` - for storing user posts

### 6. Set Firestore Rules (Development)

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

## 📁 Project Structure

```
lib/
├── auth/
│   ├── auth_page.dart           # Authentication handler
│   └── login_or_register.dart   # Login/Register toggle page
├── feature/
│   ├── pages/
│   │   ├── home_page.dart       # Main feed/wall page
│   │   ├── login_page.dart      # Login UI
│   │   ├── profile_page.dart    # User profile page
│   │   ├── register_page.dart   # Registration UI
│   │   └── user_page.dart       # Browse users page
│   ├── theme/
│   │   ├── dark_mode.dart       # Dark theme configuration
│   │   └── light_mode.dart      # Light theme configuration
├── helper/
│   └── helper_functions.dart    # Utility functions
├── widget/
│   ├── my_button.dart           # Reusable button widget
│   ├── my_drawer.dart           # Navigation drawer
│   ├── my_textformfield.dart    # Text input field
│   └── my_post_button.dart      # Post submission button
├── firebase_options.dart        # Firebase configuration
└── main.dart                    # Application entry point
```

## 💻 Usage

### Running the App

```bash
# Run on connected device/emulator
flutter run

# Run with verbose output
flutter run -v

# Run on specific device
flutter run -d <device_id>
```

### Building APK (Android)

```bash
flutter build apk --release
```

### Building iOS

```bash
flutter build ios --release
```

### Main Screens

1. **Auth Page** - Initial authentication check
2. **Login/Register Page** - User account management
3. **Home Page (Wall)** - Create posts and view feed
4. **Profile Page** - View user information
5. **User Page** - Browse all users
6. **Navigation Drawer** - Quick navigation

## 🔨 Building & Deployment

### Development Build

```bash
flutter build apk --debug
```

### Release Build

```bash
flutter build apk --release
flutter build ios --release
```

### Web (if enabled)

```bash
flutter build web --release
```

## 📦 Dependencies

- **flutter**: Flutter SDK
- **firebase_core**: ^4.13.0 - Firebase initialization
- **firebase_auth**: ^6.5.7 - User authentication
- **cloud_firestore**: ^6.8.0 - Cloud database
- **cupertino_icons**: ^1.0.8 - iOS-style icons
- **flutter_lints**: ^6.0.0 - Code quality analysis

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📚 Learning Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design](https://material.io/design)

## 🐛 Troubleshooting

### Firebase Connection Issues

- Verify your `google-services.json` is in the correct location
- Check Firebase project is properly configured
- Ensure authentication is enabled in Firebase Console

### Build Errors

```bash
flutter clean
flutter pub get
flutter pub upgrade
```

### Emulator Issues

```bash
flutter emulators
flutter emulators launch <emulator_name>
```

## 👨‍💻 Author

**FAHIMSHAKIL102**

Feel free to reach out for questions or suggestions!

---

**Last Updated**: August 2026
