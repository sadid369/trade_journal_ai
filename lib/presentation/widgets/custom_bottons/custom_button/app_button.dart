import 'package:flutter/material.dart';

import '../../../../utils/app_colors/app_colors.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color? disabledBackgroundColor;
  final double borderRadius;
  final TextStyle textStyle;
  final bool enabled;
  final double? borderWidth;
  final Color? borderColor;
  final Widget? icon; // <-- Add this line

  const AppButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.width = double.infinity,
    this.height = 48,
    this.backgroundColor = AppColors.primary,
    this.disabledBackgroundColor,
    this.borderRadius = 8,
    required this.textStyle,
    this.enabled = true,
    this.borderWidth,
    this.borderColor,
    this.icon, // <-- Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = enabled && onPressed != null;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          side: borderWidth == null || borderColor == null
              ? null
              : BorderSide(width: borderWidth!, color: borderColor!),
          backgroundColor: isEnabled
              ? backgroundColor
              : (disabledBackgroundColor ?? backgroundColor.withOpacity(0.4)),
          disabledBackgroundColor:
              disabledBackgroundColor ?? backgroundColor.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: icon == null
            ? Text(text, style: textStyle)
            : Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // <-- Align to start
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize:
                    MainAxisSize.max, // <-- Use full width for alignment
                children: [
                  icon!,
                  SizedBox(width: 8),
                  Text(text, style: textStyle),
                ],
              ),
      ),
    );
  }
}
