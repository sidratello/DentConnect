import 'package:flutter/material.dart';
import 'package:template/core/app_colors.dart';
import 'package:template/core/app_text_styles.dart';

enum AppButtonType {
  filled,
  outlined,
  customDecoration,
  gradient,
}

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  final AppButtonType type;

  final double width;
  final double height;
  final double borderRadius;

  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;

  final BoxDecoration? decoration;

  final Widget? icon;
  final bool isLoading;
  final bool enabled;

  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.type = AppButtonType.filled,
    this.width = double.infinity,
    this.height = 48,
    this.borderRadius = 14,
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.decoration,
    this.icon,
    this.isLoading = false,
    this.enabled = true,
    this.padding,
  });

  bool get _isDisabled => !enabled || isLoading || onTap == null;

  @override
  Widget build(BuildContext context) {
    if (type == AppButtonType.customDecoration ||
        type == AppButtonType.gradient) {
      return _CustomButton(
        width: width,
        height: height,
        borderRadius: borderRadius,
        decoration: decoration ?? _gradientDecoration(),
        onTap: _isDisabled ? null : onTap,
        isDisabled: _isDisabled,
        child: _content(),
      );
    }

    if (type == AppButtonType.outlined) {
      return SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          onPressed: _isDisabled ? null : onTap,
          style: OutlinedButton.styleFrom(
            padding: padding,
            backgroundColor: backgroundColor ?? AppColors.white,
            side: BorderSide(
              color: borderColor ?? AppColors.primaryBlue,
              width: 1.2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: _content(
            defaultColor: textColor ?? AppColors.primaryBlue,
          ),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: _isDisabled ? null : onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding,
          backgroundColor: backgroundColor ?? AppColors.primaryBlue,
          disabledBackgroundColor: AppColors.primaryBlue.withOpacity(0.45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: _content(
          defaultColor: textColor ?? AppColors.white,
        ),
      ),
    );
  }

  Widget _content({Color? defaultColor}) {
    if (isLoading) {
      return SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(
          strokeWidth: 2.4,
          color: defaultColor ?? AppColors.white,
        ),
      );
    }

    final text = Text(
      title,
      style: textStyle ??
          AppTextStyles.ibmRegular16WhiteStyle.copyWith(
            color: defaultColor ?? textColor ?? AppColors.white,
            fontWeight: FontWeight.w600,
          ),
      textAlign: TextAlign.center,
    );

    if (icon == null) return text;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon!,
        const SizedBox(width: 8),
        text,
      ],
    );
  }


  BoxDecoration _gradientDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xFF8DB6FF),
          Color(0xFF075AFF),
        ],
      ),
       image: const DecorationImage(
      image: AssetImage('assets/images/Frame 2608747 (1)_cleanup.png'),
      alignment: Alignment.centerLeft,
      fit: BoxFit.cover,
      opacity: 0.35,
    ),
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: AppColors.primaryBlue.withOpacity(0.22),
          blurRadius: 14,
          offset: const Offset(0, 7),
        ),
      ],
    );
  }
}

class _CustomButton extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;
  final BoxDecoration decoration;
  final VoidCallback? onTap;
  final Widget child;
  final bool isDisabled;

  const _CustomButton({
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.decoration,
    required this.onTap,
    required this.child,
    required this.isDisabled,
  });

  @override
  State<_CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<_CustomButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _pressed ? 0.97 : 1,
      duration: const Duration(milliseconds: 120),
      child: GestureDetector(
        onTapDown: widget.isDisabled
            ? null
            : (_) {
                setState(() => _pressed = true);
              },
        onTapUp: widget.isDisabled
            ? null
            : (_) {
                setState(() => _pressed = false);
              },
        onTapCancel: widget.isDisabled
            ? null
            : () {
                setState(() => _pressed = false);
              },
        onTap: widget.onTap,
        child: Opacity(
          opacity: widget.isDisabled ? 0.55 : 1,
          child: Container(
            width: widget.width,
            height: widget.height,
            alignment: Alignment.center,
            decoration: widget.decoration,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}