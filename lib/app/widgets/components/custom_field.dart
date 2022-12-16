import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fmt/app/widgets/atoms/inputfieldlabel.dart';
import 'package:fmt/utils/theme/colors.dart';
import 'package:get/get.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    this.title = "title",
    required this.hinttext,
    this.maxLine,
    this.isObsecureText = false,
    this.isSuffexIcon = false,
    this.isRequried = false,
    this.keyboardInputType = TextInputType.text,
    required this.textEditingController,
    this.validator,
    this.onchanged,
    this.suffixIconCallBack,
    this.maxLength,
  });
  final String title;
  final String hinttext;
  final int? maxLine;
  final bool isObsecureText;
  final bool isSuffexIcon;
  final bool isRequried;
  final TextInputType keyboardInputType;
  final TextEditingController textEditingController;
  final Function? validator;
  final Function? onchanged;
  final VoidCallback? suffixIconCallBack;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return InputFieldLable(
      required: isRequried,
      lable: title,
      child: TextFormField(
        maxLength: maxLength,
        maxLines: maxLine,
        obscureText: isObsecureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.blackColor,
        validator: (value) => validator != null ? validator!(value) : null,
        controller: textEditingController,
        keyboardType: keyboardInputType,
        style: Get.theme.textTheme.caption,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            borderSide: BorderSide.none,
          ),
          fillColor: AppColors.whiteColor,
          filled: true,
          hintText: hinttext,
        ),
      ),
    );
  }
}
