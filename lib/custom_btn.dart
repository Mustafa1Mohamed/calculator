
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final int flex;
  final String txt;
  final Color? txtColor;
  final Color? bgColor;
  final bool isBackspace;
  final void Function(String) onPressed;
  const CustomBtn({
    this.isBackspace = false,
    super.key,
    this.flex = 1,
    required this.txt,
    this.txtColor,
    this.bgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Container(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: (){
              onPressed(txt);
            },
            backgroundColor: bgColor ?? Color(0xff303136),
            child: isBackspace
                ? Icon(Icons.backspace_outlined, color: txtColor)
                : Text(
              txt,
              style: TextStyle(
                color: txtColor ?? Color(0xff29A8FF),
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
