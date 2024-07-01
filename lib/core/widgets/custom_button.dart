import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
  });
  final String title;
  final Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.sizeOf(context).width * .25, 53),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.blue,
                )
              : Text(
                  title,
                ),
        ));
  }
}
