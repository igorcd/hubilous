import 'package:flutter/material.dart';

enum TextStyleEnum {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  labelLarge,
  labelMedium,
  labelSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
}

class AbText extends StatelessWidget {
  final String content;
  final TextStyleEnum? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const AbText(this.content, {this.style, this.textAlign, this.textOverflow, this.maxLines, Key? key}) : super(key: key);

  factory AbText.displayLarge(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.displayLarge, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.displayMedium(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.displayMedium, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.displaySmall(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.displaySmall, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.headlineLarge(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.headlineLarge, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.headlineMedium(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.headlineMedium, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.headlineSmall(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.headlineSmall, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.titleLarge(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.titleLarge, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.titleMedium(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.titleMedium, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.titleSmall(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.titleSmall, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.labelLarge(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.labelLarge, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.labelMedium(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.labelMedium, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.labelSmall(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.labelSmall, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.bodyLarge(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.bodyLarge, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.bodyMedium(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.bodyMedium, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }
  factory AbText.bodySmall(String content, {TextAlign? textAlign, int? maxLines, TextOverflow? textOverflow}) {
    return AbText(content, style: TextStyleEnum.bodySmall, textAlign: textAlign, maxLines: maxLines, textOverflow: textOverflow);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var is2xsScreen = MediaQuery.of(context).size.width < 360;

    // Função para retornar
    TextStyle? getTextStyle() {
      switch (style) {
        case TextStyleEnum.displayLarge:
          return theme.displayLarge;

        case TextStyleEnum.displayMedium:
          return theme.displayMedium;

        case TextStyleEnum.displaySmall:
          return theme.displaySmall;

        case TextStyleEnum.headlineLarge:
          return theme.headlineLarge;

        case TextStyleEnum.headlineMedium:
          return theme.headlineMedium;

        case TextStyleEnum.headlineSmall:
          return theme.headlineSmall;

        case TextStyleEnum.titleLarge:
          return theme.titleLarge;

        case TextStyleEnum.titleMedium:
          return theme.titleMedium;

        case TextStyleEnum.titleSmall:
          return theme.titleSmall;

        case TextStyleEnum.labelLarge:
          return theme.labelLarge;

        case TextStyleEnum.labelMedium:
          return theme.labelMedium;

        case TextStyleEnum.labelSmall:
          return theme.labelSmall;

        case TextStyleEnum.bodyLarge:
          return theme.bodyLarge;

        case TextStyleEnum.bodyMedium:
          return theme.bodyMedium;

        case TextStyleEnum.bodySmall:
          return theme.bodySmall;

        default:
          return theme.bodyMedium;
      }
    }

    return Text(
      content,
      style: getTextStyle(),
      textAlign: textAlign,
      textScaleFactor: is2xsScreen ? .8 : 1,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
