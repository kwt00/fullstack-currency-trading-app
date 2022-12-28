// import 'dart:html';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FFButtonOptions {
  const FFButtonOptions({
    required this.textStyle,
    required this.elevation,
    required this.height,
    required this.width,
    required this.padding,
    required this.color,
    required this.iconSize,
    required this.iconColor,
    required this.iconPadding,
    required this.borderRadius,
    required this.borderSide,
  });

  final TextStyle textStyle;
  final double elevation;
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double iconSize;
  final Color iconColor;
  final EdgeInsetsGeometry iconPadding;
  final double borderRadius;
  final BorderSide borderSide;
}

class FFButtonWidget extends StatelessWidget {
  const FFButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    required this.options,
    this.loading = false,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final VoidCallback onPressed;
  final FFButtonOptions options;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = loading
        ? Center(
            child: Container(
              width: 23,
              height: 23,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  options.textStyle.color ?? Colors.white,
                ),
              ),
            ),
          )
        : AutoSizeText(
            text,
            style: options.textStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
    if (icon != null) {
      textWidget = Flexible(child: textWidget);
      return Container(
        height: options.height,
        width: options.width,
        child: IconButton(
          icon: Padding(
            padding: options.iconPadding,
            child: icon,
          ),
          // label: textWidget,
          onPressed: loading ? () {} : onPressed,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(options.borderRadius),
          //   side: options.borderSide,
          // ),
          // color: options.color,
          // colorBrightness: ThemeData.estimateBrightnessForColor(options.color),
          // textColor: options.textStyle.color,
          // elevation: options.elevation,
        ),
      );
    }

    return Container(
      height: options.height,
      width: options.width,
      child: TextButton(
        onPressed: onPressed,    
        child: textWidget,
      ),
    );
  }
}