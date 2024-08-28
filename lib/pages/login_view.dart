
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/pages/home_view.dart';
import 'package:store_app/pages/sign_up_view.dart';
import 'package:store_app/widgets/custom_elevated_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:store_app/widgets/divider_login.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;
  String? email, password;
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Text(
                      'Sign into continue',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          onchanged: (data){
                            email = data;
                          },
                          hintText: 'Email Id',
                        ),
                        const SizedBox(height: 12,),
                        const Text(
                          'Password',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 8,),
                        CustomTextField(
                          sufix: isPasswordShow
                              ? Icons.visibility
                              : Icons.visibility_off,
                          obsecuretext: isPasswordShow,
                          sufixPressed: () {
                            setState(() {
                              isPasswordShow = !isPasswordShow;
                            });
                          },
                          onchanged: (data) {
                            password = data;
                          },
                          hintText: 'Password',
                          icon: Icons.remove_red_eye,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    CustomElevatedButton(
                      function: () async{
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await loginMethod();
                            Navigator.pushNamed(context, HomeView.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showSnackBar(context, 'user not found');
                            } else if (e.code == 'wrong-password') {
                              showSnackBar(context, 'wrong password');
                            }
                          } catch (e) {
                            showSnackBar(context, 'there is an error');
                          }
                        } 
                      }, 
                      text: 'Login', 
                    ),
                    const SizedBox(height: 10,),
                    HaveAccount(
                      Mtext: 'Create an account?',
                      Stext: 'Sign Up',
                      ontap: () {
                        Navigator.pushNamed(context, SignUpView.id);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginMethod() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email!, password: password!);
  }
}