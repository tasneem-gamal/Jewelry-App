import 'package:flutter/material.dart';
import 'package:store_app/pages/get_started_log_sign_view.dart';
import 'package:store_app/widgets/custom_elevated_button.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});
  
  static String id = 'GetStartedView';
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
              padding: const EdgeInsets.all(8.0),
              child: CustomElevatedButton(
                function: () {
                  Navigator.pushNamed(context, GetStartedLogSignView.id);
                },
                text: 'Get Started',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
