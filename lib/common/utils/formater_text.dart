import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<InlineSpan> formaterTexte(String texte) {
  List<InlineSpan> spans = [];
  final regExpGras = RegExp(r'\*(.*?)\*'); // Gras entre '*'
  final regExpItalique = RegExp(r'_([^_]+)_'); // Italique entre '_'
  final regExpSouligne = RegExp(r'~(.*?)~'); // Souligné entre '~'
  int lastIndex = 0;

  for (var match in regExpGras.allMatches(texte)) {
    if (match.start > lastIndex) {
      spans.addAll(
        formaterTexteNormal(texte.substring(lastIndex, match.start)),
      );
    }

    spans.add(
      TextSpan(
        text: match.group(1),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    lastIndex = match.end;
  }

  for (var match in regExpItalique.allMatches(texte)) {
    if (match.start > lastIndex) {
      spans.addAll(
        formaterTexteNormal(texte.substring(lastIndex, match.start)),
      );
    }

    spans.add(
      TextSpan(
        text: match.group(1),
        style: const TextStyle(
          fontStyle: FontStyle.italic,
        ),
      ),
    );

    lastIndex = match.end;
  }

  for (var match in regExpSouligne.allMatches(texte)) {
    if (match.start > lastIndex) {
      spans.addAll(
        formaterTexteNormal(texte.substring(lastIndex, match.start)),
      );
    }

    spans.add(
      TextSpan(
        text: match.group(1),
        style: const TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );

    lastIndex = match.end;
  }

  if (lastIndex < texte.length) {
    spans.addAll(formaterTexteNormal(texte.substring(lastIndex, texte.length)));
  }

  return spans;
}

List<InlineSpan> formaterTexteNormal(String texte) {
  return texte.split('\n').map((ligne) {
    return TextSpan(
      text: ligne,
      //style: TextStyle(fontSize: 16.0),
    );
  }).toList();
}

String truncateText(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  }
  return '${text.substring(0, maxLength)}...';
}
