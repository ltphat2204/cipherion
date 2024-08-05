import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:music_lyrica/common/widgets/code_input/code_input.dart';

class VerificationScreen extends StatelessWidget {
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
                'Verification',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: Text(
                'A verification code had been sent to your email.',
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: Color.fromRGBO(131, 145, 161, 1),
                    ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: Text(
                'Code expired!',
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: Color.fromRGBO(131, 145, 161, 1),
                    ),
              ),
            ),
            // Code
            CodeInput(),
            // button
            Container(
              width: 360,
              height: 56,
              margin: EdgeInsets.only(top: 30, left: 24),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Verify',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
