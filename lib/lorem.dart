/// A simple library for generating lorem ipsum text
library lorem;

import "dart:math";
part "words.dart";

class Lorem {
  _randomInt ( int min,  int max ) {
    Random rnd = new Random();
    return rnd.nextInt((max - min) + 1) + min;
  }

  /// Creates a random sentence.
  ///
  /// Sentences are either exactly [sentenceLength] in length, or a randomly
  /// generated length.
  ///
  /// Example: "Nunc pulvinar sapien et ligula."
  String createSentence({int sentenceLength : -1}){
    int wordIndex;
    String sentence;

    if(sentenceLength<0){
      sentenceLength = _randomInt(5, 20);
    }

    wordIndex = _randomInt(0, words.length - sentenceLength - 1);
    sentence = words.getRange(wordIndex, wordIndex + sentenceLength).join(" ");
    sentence = sentence[0].toUpperCase() + sentence.substring(1) + ".";

    return sentence;
  }

  /// Creates a single paragraph.
  ///
  /// Paragraphs are comprised of a random number of sentences, or explicitly
  /// [numSentences] long.
  String createParagraph({int numSentences : -1}){
    List<String> sentences = [];

    if(numSentences<0){
      numSentences = _randomInt(3,5);
    }
    for(var i=0; i< numSentences; i++){
      sentences.add(createSentence());
    }

    return sentences.getRange(0, sentences.length).join(" ");
  }

  /// Creates a text comprised of a number of paragraphs.
  ///
  /// Each text is comprised of [numParagraphs] paragraphs, each of which
  /// contain [numSentences] sentences. If either parameter is omitted, a
  /// random number is generated.
  String createText({int numParagraphs : -1, int numSentences : -1}){
    List<String> paragraphs = [];

    if(numParagraphs<0){
      numParagraphs = _randomInt(3,7);
    }
    for(var i=0; i< numParagraphs; i++){
      paragraphs.add(createParagraph(numSentences: numSentences));
    }

    return paragraphs.getRange(0, paragraphs.length).join("\n");
  }

}