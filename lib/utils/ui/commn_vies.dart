import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class CommunViews {
  static final CommunViews _shared = CommunViews._private();

  factory CommunViews() => _shared;

  CommunViews._private();

  //widget appBar
  AppBar getAppBar({required String title}) {
    return AppBar(
      backgroundColor: Colors.teal,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      title: Text(title,
        style:GoogleFonts.alkalami(
          fontSize: 20.sp,
        ),
      ),
      centerTitle: true,
    );
  }

  //widget ElevatedButton
  Widget createButton(
      {required String title, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }

//Text form field
  Widget createTextFormFiled(
      {required TextEditingController controller, required FocusNode focusNode,
        required String label,
        TextInputType keyboardType = TextInputType.text,
        TextInputAction InputActione = TextInputAction.done,
        bool isObscuer = false,
        ValueChanged<String>?onSubmitted,
        String ?preffixText,
        Widget ?suffixIcon,
        String ?errorText,
      }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isObscuer,
      keyboardType: keyboardType,
      textInputAction: InputActione,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        prefixText: preffixText,
        suffixIcon: suffixIcon,
        errorText: errorText,
        border: _getBorder(),
        enabledBorder: _getBorder(),
        disabledBorder: _getBorder(),
        focusedBorder: _getBorder(),
      ),
    );
  }

  // widget border in text form filed
  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    );
  }


//snackbar
  void showSnackBar(String title,String msg){
    Get.snackbar(
      title, msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      duration:const Duration(seconds: 5),
    );
  }
}

