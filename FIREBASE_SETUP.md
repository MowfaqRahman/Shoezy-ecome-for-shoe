# Firebase Setup Guide for Shoe Shopping App

This guide will help you set up Firebase authentication for your Flutter app.

## Prerequisites
- Flutter SDK installed
- Firebase account
- Google account

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project" or "Add project"
3. Enter a project name (e.g., "shoe-shopping-app")
4. Choose whether to enable Google Analytics (recommended)
5. Click "Create project"

## Step 2: Enable Authentication

1. In your Firebase project, click on "Authentication" in the left sidebar
2. Click "Get started"
3. Go to the "Sign-in method" tab
4. Click on "Email/Password"
5. Enable "Email/Password" authentication
6. Click "Save"

## Step 3: Create Firestore Database

1. In your Firebase project, click on "Firestore Database" in the left sidebar
2. Click "Create database"
3. Choose "Start in test mode" for development
4. Select a location for your database
5. Click "Done"

## Step 4: Get Firebase Configuration

1. In your Firebase project, click on the gear icon (⚙️) next to "Project Overview"
2. Select "Project settings"
3. Scroll down to "Your apps" section
4. Click on the web app icon (</>)
5. Enter an app nickname (e.g., "shoe-shopping-web")
6. Click "Register app"
7. Copy the Firebase configuration object

## Step 5: Update Web Configuration

1. Open `web/index.html`
2. Replace the placeholder Firebase config with your actual config:

```javascript
const firebaseConfig = {
  apiKey: "your-actual-api-key",
  authDomain: "your-project.firebaseapp.com",
  projectId: "your-project-id",
  storageBucket: "your-project.appspot.com",
  messagingSenderId: "your-sender-id",
  appId: "your-app-id",
  measurementId: "your-measurement-id"
};
```

## Step 6: Install Dependencies

Run the following command to install Firebase dependencies:

```bash
flutter pub get
```

## Step 7: Test the App

1. Run your app: `flutter run -d chrome`
2. Try to create a new account using the signup screen
3. Try to login with the created account
4. Test logout functionality

## Features Implemented

### Authentication Service (`lib/services/auth_service.dart`)
- ✅ User registration with email/password
- ✅ User login with email/password
- ✅ User logout
- ✅ Password reset
- ✅ User profile management
- ✅ Firestore integration for user data

### Updated Screens
- ✅ Login screen with Firebase authentication
- ✅ Signup screen with Firebase authentication
- ✅ Home screen with Firebase logout
- ✅ Error handling and user feedback

### Security Features
- ✅ Email validation
- ✅ Password strength requirements
- ✅ User-friendly error messages
- ✅ Secure authentication flow

## Firebase Rules (Optional)

For production, you should set up proper Firestore security rules:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```

## Troubleshooting

### Common Issues

1. **"Firebase not initialized" error**
   - Make sure you've added the Firebase config to `web/index.html`
   - Check that `firebase_core` is properly imported

2. **Authentication not working**
   - Verify that Email/Password authentication is enabled in Firebase Console
   - Check that your Firebase config is correct

3. **Firestore permission denied**
   - Ensure Firestore is created and rules allow read/write
   - Check that you're in test mode for development

### Getting Help

- [Firebase Documentation](https://firebase.google.com/docs)
- [Flutter Firebase Plugin](https://firebase.flutter.dev/)
- [Firebase Console](https://console.firebase.google.com/)

## Next Steps

After setting up Firebase authentication, you can:

1. Add user profile management
2. Implement password reset functionality
3. Add social authentication (Google, Facebook, etc.)
4. Set up user preferences and settings
5. Implement user roles and permissions
6. Add analytics and crash reporting

## Security Notes

- Never commit Firebase config keys to public repositories
- Use environment variables for sensitive configuration
- Implement proper validation on both client and server side
- Regularly review Firebase security rules
- Monitor authentication logs for suspicious activity

