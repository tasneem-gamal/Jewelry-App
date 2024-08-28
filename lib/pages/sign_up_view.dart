
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/helper/show_snack_bar.dart';
import 'package:store_app/pages/home_view.dart';
import 'package:store_app/widgets/custom_elevated_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:store_app/widgets/divider_login.dart';
import 'package:store_app/widgets/sign_up_title.dart';

// ignore: must_be_immutable
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  
  //var
  static String id = 'SignUpView';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;
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
                    const SignUpTitle(),
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
                      function: () async {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          try {
                            await registermethod();
                            Navigator.pushNamed(context, HomeView.id);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(context, 'weak-password');
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context, 'email-already-in-use');
                            }
                          } catch (e) {
                            showSnackBar(context, 'there is an error');
                          }
                        } 
                        isLoading = false;
                        setState(() {});
                      },
                      text: 'Sign Up',
                    ),
                    const SizedBox(height: 10,),
                    HaveAccount(
                      Mtext: 'Already have an account?',
                      Stext: 'Login',
                      ontap: () {
                        Navigator.pop(context);
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
  Future<void> registermethod() async {
    // ignore: unused_local_variable
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email!, password: password!);
  }
}