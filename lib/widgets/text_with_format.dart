import 'package:flutter/material.dart';

class TextWithFormat extends StatelessWidget {
  final String text;
  final bool bold;
  final bool italic;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final bool selectable;
  final int? fontWeight;
  final TextAlign? textAlign;

  const TextWithFormat(this.text,
      {Key? key,
      this.bold = false,
      this.italic = false,
      this.fontSize,
      this.color,
      this.maxLines,
      this.selectable = false,
      this.fontWeight,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, FontWeight> weights = {
      100: FontWeight.w100,
      200: FontWeight.w200,
      300: FontWeight.w300,
      400: FontWeight.w400,
      500: FontWeight.w500,
      600: FontWeight.w600,
      700: FontWeight.w700,
      800: FontWeight.w800,
      900: FontWeight.w900,
    };
    return selectable
        ? SelectableText(
            text,
            style: TextStyle(
              fontWeight: fontWeight != null
                  ? weights[fontWeight]
                  : bold
                      ? FontWeight.bold
                      : FontWeight.normal,
              fontStyle: italic ? FontStyle.italic : FontStyle.normal,
              fontSize: fontSize,
              color: color,
            ),
            maxLines: maxLines,
            textAlign: textAlign,
          )
        : Text(
            text,
            style: TextStyle(
              fontWeight: fontWeight != null
                  ? weights[fontWeight]
                  : bold
                      ? FontWeight.bold
                      : FontWeight.normal,
              fontStyle: italic ? FontStyle.italic : FontStyle.normal,
              fontSize: fontSize,
              color: color,
            ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            textAlign: textAlign,
          );
  }
}
