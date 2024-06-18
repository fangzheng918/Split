import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/services/google_auth.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        icon: Image.asset('lib/images/google.jpg'),
        iconSize: 50,
        onPressed: () async {
          UserCredential userCredential =
              await AuthService().signInWithGoogle();
          if (userCredential.user != null) {
            // User signed in successfully
            User user = userCredential.user!;

            // Access user information
            String userId = user.uid;
            String? displayName = user.displayName;
            String? email = user.email;
            // ... access other user properties as needed

            // Print user information
            print('User signed in successfully.');
            print('User ID: $userId');
            print('Display Name: $displayName');
            print('Email: $email');

            // Return the signed-in user
          } else {
            // Sign-in failed
            print('Sign-in failed. User credentials not available.');
            return null;
          }
        },
      ),
    ]);
  }
}
