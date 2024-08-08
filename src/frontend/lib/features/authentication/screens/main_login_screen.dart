// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:music_lyrica/common/widgets/button/button.dart';
import 'package:music_lyrica/features/authentication/screens/forgot_pass.dart';
import 'package:music_lyrica/features/music/screens/navigation_menu.dart';

class MainLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color.fromRGBO(33, 15, 51, 1)),
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
              // WELCOME
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: Text(
                  'Welcome back!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: Text(
                  'Glad to see you, Again!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),

              // Input Email and Password
              Form(
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 50, left: 24),
                        child: TextForm(hint: "Enter your email")),
                    Stack(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 20, left: 24),
                            child: TextForm(hint: "Enter your password")),
                        Positioned(
                          top: 40,
                          right: 20,
                          child: Image.asset(
                            'assets/icons/hide_pass.png',
                            width: 20,
                            height: 20,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Forgot Password
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ForgotPasswordScreen();
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 246),
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: Color.fromRGBO(195, 71, 216, 1),
                        ),
                  ),
                ),
              ),
              // Login Button
              Container(
                width: 360,
                height: 56,
                margin: const EdgeInsets.only(top: 20, left: 24),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return NavigationMenu();
                      }));
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text('Login')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  String hint;

  TextForm({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.transparent),
        color: Color.fromRGBO(41, 27, 60, 1),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, top: 5),
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                color: Color.fromRGBO(133, 128, 167, 1),
              ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ), // Add closing parenthesis here
      ),
    );
  }
}
