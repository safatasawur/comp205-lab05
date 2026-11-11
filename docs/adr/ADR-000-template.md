# ADR-001: AI Assistance in Firebase Lab 5

**Date:** 11 November 2026  
**Author:** Safa 
**Milestone:** COMP 205 — Lab 5  
**AI Tool:** ChatGPT (GPT-6)

## 1. Context

The objective of Lab 5 was to develop a Flutter Study Notes application using Firebase Authentication, Cloud Firestore, and Firebase Cloud Messaging.

The application allows users to register, log in, add notes, view notes in real time, delete notes, and receive push notifications.

I used ChatGPT to help understand the lab instructions, configure Firebase, and implement the missing TODO sections in the provided Flutter project.

## 2. AI Prompts Used

I asked ChatGPT questions such as:

- "Help me do it step by step."
- "Give me the code directly."
- "What next file to change?"
- "Can I use Chrome DevTools instead of an emulator?"

ChatGPT provided explanations, code suggestions, and troubleshooting guidance.

## 3. AI-Generated Suggestions

ChatGPT helped with the following tasks:

**Firebase Configuration:** Guided me through creating a Firebase project, enabling Email/Password Authentication, creating a Firestore database, installing Firebase CLI and FlutterFire CLI, and connecting the Flutter project to Firebase.

**Note Model:** Suggested implementations of `fromFirestore()` and `toFirestore()` to convert note data between Dart objects and Firestore documents.

**Authentication:** Suggested implementations for user registration, login, logout, and user-friendly Firebase error messages.

**Notes Repository:** Suggested methods to add, retrieve, and delete notes using Cloud Firestore.

**Notes Screen:** Suggested Flutter widgets such as `StreamBuilder`, `ListTile`, and `Dismissible` to display and manage notes.

**Security Rules:** Suggested Firestore rules restricting users to their own notes and validating note titles.

**Push Notifications:** Suggested Firebase Cloud Messaging code to request permission, subscribe to the `comp205` topic, and listen for foreground messages.

**GitHub:** Provided guidance on Git initialization, commits, and pushing the project to GitHub.

## 4. Rejected or Modified AI Suggestions

ChatGPT initially suggested using an Android emulator for running and testing the application.

Because I did not have an Android emulator or physical Android device available, I chose to use Google Chrome and Chrome DevTools for development and testing where supported.

I also configured FlutterFire for both Android and Web instead of Android alone.

This allowed browser-based development, but Chrome DevTools could not replace the Android push-notification test required by the lab.

## 5. Verification

**Firebase CLI:** Successfully installed, version 15.35.0.

**Firebase Authentication:** Email/Password Authentication enabled.

**FlutterFire CLI:** Successfully installed, version 1.5.0.

**Firebase Configuration:** Successfully configured for Android and Web.

**Automated Tests:** All tests passed successfully using `flutter test`.

**GitHub Username:** safatasawur

**Git Commit Hash:** 6f1bb42

**Git Commit Message:** messaging service

**Git Branch:** main

**GitHub Push Status:** Local and remote main branches are synchronized.

**Firestore Security Rules:** Owner-only access rules implemented; Rules Playground verification not yet confirmed.

**GitHub Actions:** CI result not yet confirmed.

**Push Notifications:** Firebase Cloud Messaging code implemented. Android notification testing not yet verified.



## 6. What I Learned

Through this lab, I learned how Firebase services can be integrated into a Flutter application.

I learned that Firebase Authentication manages user accounts, while Cloud Firestore stores application data and supports real-time updates.

I also learned how Firestore security rules restrict access to authenticated users and how Firebase Cloud Messaging supports push notifications.

Using AI helped me understand the implementation steps and troubleshoot configuration problems. I reviewed the suggested code to understand its purpose and used testing to check its correctness.

## 7. Final Decision

I used ChatGPT (GPT-6) to understand the lab requirements, configure Firebase, implement Flutter functionality, and troubleshoot development issues.

I configured Firebase for Android and Web because I did not have an Android emulator available.

All automated tests passed successfully.

The project was tracked using Git and pushed to GitHub.

**Commit Reference:** 6f1bb42 — messaging service
