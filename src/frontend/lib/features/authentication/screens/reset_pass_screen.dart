import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/features/authentication/screens/main_login_screen.dart';
import 'package:music_lyrica/features/authentication/screens/pass_change_success_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back
            Container(
              margin: const EdgeInsets.only(top: 50, left: 24),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // LOGO
            Center(
              child: Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(top: 50, bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                    image: AssetImage('assets/logos/main_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Text
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: Text(
                'Create',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: Text(
                'new password!',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 24),
              child: TextForm(hint: 'New Password'),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 24),
              child: TextForm(hint: 'Confirm Password'),
            ),
            Container(
              height: 56,
              width: 360,
              margin: const EdgeInsets.only(top: 40, left: 24),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PasswordChangeSuccessfullyScreen()));
                },
                child: const Text('Reset Password'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
