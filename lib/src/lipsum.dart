/// A simple library for generating lorem ipsum text
library lipsum;

import "dart:math";
import 'words.dart';

_randomInt(int min, int max) {
  Random rnd = new Random();
  return rnd.nextInt((max - min) + 1) + min;
}

/// Creates [numWords] number of random words.
String createWord({int numWords = 1}) {
  Random _random;

  if (numWords > 1) {
    return createSentence(sentenceLength: numWords, numSentences: 1);
  }

  _random = Random();
  return words[_random.nextInt(words.length)];
}

/// Creates random sentences.
///
/// Sentences are either exactly [sentenceLength] words in length, or a randomly
/// generated length. [numSentences] defines the number of sentences generated.
/// Returned sentences are punctuated.
String createSentence({int sentenceLength = -1, int numSentences = 1}) {
  int wordIndex;
  String sentence;

  if (numSentences > 1)
    return createParagraph(numSentences: numSentences);

  if (sentenceLength < 0) {
    sentenceLength = _randomInt(5, 20);
  }

  wordIndex = _randomInt(0, words.length - sentenceLength - 1);
  sentence = words.getRange(wordIndex, wordIndex + sentenceLength).join(" ");
  sentence = sentence[0].toUpperCase() + sentence.substring(1) + ".";

  return sentence;
}

/// Creates random paragraphs.
///
/// Paragraphs are comprised of a random number of sentences, or explicitly
/// [numSentences] long. [numParagraphs] specifies the number of paragraphs
/// to generate.
String createParagraph({int numSentences = -1, int numParagraphs = 1}) {
  List<String> sentences = [];

  if (numParagraphs > 1)
    return createText(numSentences: numSentences, numParagraphs: numParagraphs);

  if (numSentences < 0) {
    numSentences = _randomInt(3, 5);
  }
  for (var i = 0; i < numSentences; i++) {
    sentences.add(createSentence());
  }

  return sentences.getRange(0, sentences.length).join(" ");
}

/// Creates a text comprised of a number of paragraphs.
///
/// Each text is comprised of [numParagraphs] paragraphs, each of which
/// contain [numSentences] sentences. If either parameter is omitted, a
/// random number is generated.
String createText({int numParagraphs = -1, int numSentences = -1}) {
  List<String> paragraphs = [];

  if (numParagraphs < 0) {
    numParagraphs = _randomInt(3, 7);
  }
  for (var i = 0; i < numParagraphs; i++) {
    paragraphs.add(createParagraph(numSentences: numSentences));
  }

  return paragraphs.getRange(0, paragraphs.length).join("\n");
}
