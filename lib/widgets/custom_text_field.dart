import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key, 
    required this.hintText, 
    this.icon, this.onchanged, 
    this.obsecuretext = false,
    this.sufix,
    this.sufixPressed
  });
  //var
  final String hintText;
  final IconData? icon;
  Function(String)? onchanged;
  bool obsecuretext;
  void Function()? sufixPressed;
  IconData? sufix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecuretext,
      validator: (data) {
        if(data!.isEmpty){
          return 'required field';
        }
        return null;
      },
      onChanged: onchanged,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          hintText: hintText,
          suffixIcon: IconButton(icon: Icon(sufix), onPressed: sufixPressed,),)
    );
  }
}