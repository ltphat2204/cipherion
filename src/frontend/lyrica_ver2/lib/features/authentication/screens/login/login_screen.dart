import 'package:flutter/material.dart';
import 'package:lyrica_ver2/common/widgets/button/button.dart';
import 'package:lyrica_ver2/common/widgets/button/login_button_social.dart';
import 'package:lyrica_ver2/features/authentication/screens/choose_avatar_screen.dart';
import 'package:lyrica_ver2/features/authentication/screens/create_account_success_screen.dart';
import 'package:lyrica_ver2/features/authentication/screens/main_login_screen.dart';
import 'package:lyrica_ver2/features/authentication/screens/register_screen.dart';
import 'package:lyrica_ver2/features/authentication/screens/reset_pass_screen.dart';
import 'package:lyrica_ver2/features/authentication/screens/verification_sceen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(13, 3, 25, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LOGO
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(top: 200, bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                  image: const DecorationImage(
                    image: AssetImage('assets/logos/main_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Button
              Center(
                child: LoginButtonSocial(
                  text: 'Continue with Google',
                  logo: 'assets/icons/google.png',
                ),
              ),
              Center(
                child: LoginButtonSocial(
                  text: 'Continue with Facebook',
                  logo: 'assets/icons/facebook.png',
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  'OR',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MainLoginScreen();
                  }));
                },
                child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Button(
                      text: 'Login',
                      color: Color(0xFF6A35DB),
                      textColor: Colors.white,
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 56,
                  width: 360,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Register',
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: Color.fromRGBO(106, 53, 219, 1),
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
