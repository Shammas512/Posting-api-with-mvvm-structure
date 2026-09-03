import 'package:flutter/material.dart';

class Roundbtn extends StatelessWidget {
  final String btnText;
  final VoidCallback ontap;
  bool isloading ;

  Roundbtn({required this.btnText, required this.ontap, this.isloading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ElevatedButton(onPressed: ontap, child:  Center(child: isloading? CircularProgressIndicator() : Text(btnText) )  ),
    );
  }
}
