import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.controller, required this.label, this.keyboardInputType, this.hint});
  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType? keyboardInputType;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: TextField(
        controller: controller,
        // style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14.sp),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.transparent,
        ),
        keyboardType: keyboardInputType,

      ),
    );
  }
}
