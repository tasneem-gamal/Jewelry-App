import 'package:flutter/material.dart';
import 'package:store_app/pages/login_view.dart';
import 'package:store_app/widgets/custom_elevated_button.dart';
import 'sign_up_view.dart';

class GetStartedLogSignView extends StatelessWidget {
  const GetStartedLogSignView({super.key});
  static String id = 'GetStartedLogSignView';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/get_started.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomElevatedButton(
                    function: () {
                      Navigator.pushNamed(context, LoginView.id);
                    },
                    text: 'Log in',
                  ),
                  const SizedBox(height: 8,),
                  CustomElevatedButton(
                    function: () {
                      Navigator.pushNamed(context, SignUpView.id);
                    },
                    text: 'Sign Up',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
