/// A simple library for generating lorem ipsum text
library lipsum;

import 'dart:math';
import 'package:lipsum/src/words.dart';

int _randomInt(int min, int max) {
  final rnd = Random();
  return rnd.nextInt((max - min) + 1) + min;
}

/// Creates [numWords] number of random words.
String createWord({int numWords = 1}) {
  Random random;

  if (numWords > 1) {
    return createSentence(sentenceLength: numWords);
  }

  random = Random();
  return words[random.nextInt(words.length)];
}

/// Creates random sentences.
///
/// Sentences are either exactly [sentenceLength] words in length, or a randomly
/// generated length. [numSentences] defines the number of sentences generated.
/// Returned sentences are punctuated.
String createSentence({int sentenceLength = -1, int numSentences = 1}) {
  int wordIndex;
  String sentence;
  var newSentenceLength = sentenceLength;

  if (newSentenceLength > 1) {
    return createParagraph(numSentences: numSentences);
  }

  if (sentenceLength < 0) {
    newSentenceLength = _randomInt(5, 20);
  }

  wordIndex = _randomInt(0, words.length - newSentenceLength - 1);
  sentence = words.getRange(wordIndex, wordIndex + newSentenceLength).join(' ');
  if (sentenceLength > 0) {
    sentence = '${sentence[0].toUpperCase()}${sentence.substring(1)}.';
  }

  return sentence;
}

/// Creates random paragraphs.
///
/// Paragraphs are comprised of a random number of sentences, or explicitly
/// [numSentences] long. [numParagraphs] specifies the number of paragraphs
/// to generate.
String createParagraph({int numSentences = -1, int numParagraphs = 1}) {
  final sentences = <String>[];
  var newNumSentences = numSentences;

  if (numParagraphs > 1) {
    return createText(
      numSentences: newNumSentences,
      numParagraphs: numParagraphs,
    );
  }

  if (numSentences < 0) {
    newNumSentences = _randomInt(3, 5);
  }
  for (var i = 0; i < numSentences; i++) {
    sentences.add(createSentence());
  }

  return sentences.getRange(0, sentences.length).join(' ');
}

/// Creates a text comprised of a number of paragraphs.
///
/// Each text is comprised of [numParagraphs] paragraphs, each of which
/// contain [numSentences] sentences. If either parameter is omitted, a
/// random number is generated.
String createText({int numParagraphs = -1, int numSentences = -1}) {
  final paragraphs = <String>[];
  var newNumParagraphs = numParagraphs;
  if (numParagraphs < 0) {
    newNumParagraphs = _randomInt(3, 7);
  }
  for (var i = 0; i < newNumParagraphs; i++) {
    paragraphs.add(createParagraph(numSentences: numSentences));
  }

  return paragraphs.getRange(0, paragraphs.length).join('\n');
}
