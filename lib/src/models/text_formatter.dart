import 'package:flutter/widgets.dart';

class FormattedTextFormatter {
  const FormattedTextFormatter({
    required this.patternChars,
    required this.style,
  }) : pattern = r'\' +
            patternChars +
            '([^\\' +
            patternChars +
            ']+)\\' +
            patternChars;

  final String pattern;
  final String patternChars;
  final TextStyle style;
}

class FormattedTextFormatter2 extends FormattedTextFormatter {
  const FormattedTextFormatter2({
    required this.patternChars,
    required this.style,
  })  : pattern = r'\@\[([^:]+):([^\]]+)\]',
        super(patternChars: patternChars, style: style);

  final String pattern;
  final String patternChars;
  final TextStyle style;
}
