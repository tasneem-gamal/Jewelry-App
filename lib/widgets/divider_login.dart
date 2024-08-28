import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HaveAccount extends StatelessWidget {
  HaveAccount({super.key, required this.Mtext, required this.Stext, this.ontap});
  
  final String Mtext;
  final String Stext;
  Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Mtext,
          style: const TextStyle(
            fontSize: 16.0
          ),
        ),
        const SizedBox(width: 8,),
        GestureDetector(
          onTap: ontap, 
          child: Text(
            Stext,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          )
        ),
      ],
    );
  }
}