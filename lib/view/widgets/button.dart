import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Botton extends StatelessWidget {
  const Botton({
    super.key,
    this.colour,
    this.tcolour,
    required this.title,
    required this.onPressed,
    this.gradient,
    this.bcolour,
    this.child,
    this.isLoading = false, // Add this new parameter
  });

  final Color? colour;
  final Color? tcolour;
  final Color? bcolour;
  final String? title;
  final Function()? onPressed;
  final Gradient? gradient;
  final Widget? child;
  final bool isLoading; // Loading state

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: 0.5,
            color: Theme.of(context).cardColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          textStyle:  TextStyle(
            fontSize: 20.sp,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900,
          ),
        ),
        onPressed: isLoading ? null : onPressed, // Disable when loading
        child: isLoading
            ? const SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: Colors.white,
          ),
        )
            : child ?? Text(
          title!,
        ),
      ),
    );
  }
}