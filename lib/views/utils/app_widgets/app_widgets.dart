import 'package:flutter/material.dart';

class AppWidgets {


  nextScreenPush({required BuildContext context, required Widget screen}) {return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));}

  nextScreenPushReplacement({required BuildContext context, required Widget screen}) {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }

  Widget elevatedButton(String text, {required void Function()? onPressed}) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  Widget sizedBox({Widget? child, double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
      child: child,
    );
  }

  Widget textFormField({void Function()? onTap,
    String? Function(String?)? validator,
    TextEditingController? controller,
    TextInputType? keyboardType,
    String? labelText,
    Widget? prefixIcon,
    bool? enabled,
    Color? cursorColor,
    Widget? suffixIcon,
    TextInputAction? textInputAction,
    bool obscureText = false}) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onTap: onTap,
      keyboardType: keyboardType,
      enabled: enabled,
      cursorColor: cursorColor,
      obscureText: obscureText,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorStyle: const TextStyle(fontSize: 13.0),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }



  PreferredSizeWidget? appBarView({Widget? title,
    Color? backgroundColor,
    double? elevation,
    bool? centerTitle,
    Widget? leading,
    double? titleSpacing,
    PreferredSizeWidget? bottom,
    ShapeBorder? shape,
    Widget? flexibleSpace,
    TextStyle? titleTextStyle,
    List<Widget>? actions,
    double? toolbarHeight}) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      leading: leading,
      titleSpacing: titleSpacing,
      bottom: bottom,
      shape: shape,
      flexibleSpace: flexibleSpace,
      actions: actions,
      titleTextStyle: titleTextStyle,
      toolbarHeight: toolbarHeight,
    );
  }



}
