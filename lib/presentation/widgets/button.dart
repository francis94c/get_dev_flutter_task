import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_dev_flutter_task/config/app_colors.dart';

class Button extends StatelessWidget {
  const Button(
    this.text, {
    super.key,
    this.onPressed,
    this.icon,
    this.iconColor,
    this.borderColor,
    this.height,
    this.textColor,
    this.disabledTextColor = Colors.grey,
    this.busy = false,
    this.bordered = false,
    this.pill = false,
    this.fontSize,
  });

  final VoidCallback? onPressed;
  final String? text;
  final Color? textColor;
  final Color disabledTextColor;
  final IconData? icon;
  final Color? iconColor;
  final Color? borderColor;
  final bool busy;
  final bool pill;
  final bool bordered;
  final double? fontSize;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 42.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return Theme.of(context).primaryColor;
            } else if (states.contains(WidgetState.disabled)) {
              return bordered ? Colors.white : Colors.grey;
            }
            return bordered ? Colors.white : Theme.of(context).primaryColor;
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(pill ? 40.r : 4.r),
              ),
              side: bordered
                  ? BorderSide(
                      color: onPressed == null
                          ? Colors.grey
                          : (borderColor ?? Theme.of(context).primaryColor),
                      width: 1.w,
                    )
                  : BorderSide.none,
            ),
          ),
        ),
        onPressed: onPressed,
        child: busy
            ? SizedBox(
                width: 20.w,
                height: 20.w,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      bordered ? AppColors.primaryColor : Colors.white),
                ),
              )
            : (icon == null
                ? Text(
                    text!,
                    style: TextStyle(
                        color: onPressed == null
                            ? disabledTextColor
                            : (bordered
                                ? (textColor ?? Theme.of(context).primaryColor)
                                : Colors.white),
                        fontSize: fontSize ?? 16.sp,
                        fontFamily: "Poppins-Regular"),
                  )
                : Icon(
                    icon,
                    color: iconColor ?? Colors.black,
                  )),
      ),
    );
  }
}
