
import 'package:firabse_realtime/utils/AppColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  static void _defaultOnTap() {}
  const CustomTextField({
    this.textEditingController,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.cursorColor = AppColors.authButtonColor,
    this.inputTextStyle,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.fillColor = AppColors.authButtonColor,
    this.suffixIcon,
    this.onChanged,
    this.suffixIconColor,
    this.borderRadius = 5,
    this.fieldBorderColor = AppColors.authButtonColor,
    this.isPassword = false,
    this.readOnly = false,
    super.key,
    this.onTapClick = _defaultOnTap,
    this.isPrefixIcon = false,
    this.focusBorderColor = AppColors.authButtonColor,
    this.height = 48,
    this.maxLength,
    this.labelText = '',
    this.onFieldSubmitted, this.prefixIcon,
  });

  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color cursorColor;
  final TextStyle? inputTextStyle;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final FormFieldValidator? validator;
  final String? hintText;
  final String labelText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final double borderRadius;
  final Color fieldBorderColor;
  final Color focusBorderColor;
  final void Function(String)? onChanged;
  final bool isPassword;
  final bool isPrefixIcon;
  final VoidCallback onTapClick;
  final bool readOnly;
  final double height;
  final void Function(String)? onFieldSubmitted;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      //shadowColor:const Color(0xff9AC699),
      child: Container(
        padding: EdgeInsets.all(0.r),
        decoration: BoxDecoration(
          boxShadow:  [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 200.r,
                color: const Color(0xffe0f9f7),),
          ],

        ),
        child: TextFormField(
          onFieldSubmitted: widget.onFieldSubmitted,
          onTap: () {
            widget.onTapClick();
          },
          onChanged: widget.onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: widget.readOnly,
          controller: widget.textEditingController,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          cursorColor: widget.cursorColor,
          style: widget.inputTextStyle,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          obscureText: widget.isPassword ? obscureText : false,
          validator: widget.validator,
          decoration: InputDecoration(

            isDense: true,
            labelText:widget.labelText ,
            errorMaxLines: 2,
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,                 // TextStyle(color: AppColors.blueLightActive),
            fillColor: widget.fillColor,
            filled: true,

           //contentPadding: EdgeInsets.zero,
            prefixIcon: widget.isPrefixIcon
                ?   Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 0, vertical:0),
              child: Icon(Icons.search,color: AppColors.authButtonColor,size: 24.h,),
            )
                : null,
            suffixIcon: widget.isPassword
                ? GestureDetector(
                onTap: toggle,
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 16, vertical: 14),
                  child: obscureText
                      ?   const Icon(
                    Icons.visibility_off_outlined,
                    color: AppColors.homeButtonColor,
                  )
                      : const Icon(Icons.visibility_outlined,
                    color: AppColors.homeButtonColor,
                      ),
                ))
                : widget.suffixIcon,
            suffixIconColor: widget.suffixIconColor,

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: widget.fieldBorderColor, width: 0),
                gapPadding: 0),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: widget.focusBorderColor, width: 0),
                gapPadding: 0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: widget.fieldBorderColor, width: 0),
                gapPadding: 0),
          ),
        ),
      ),
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}