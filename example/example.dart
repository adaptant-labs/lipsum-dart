import 'package:lipsum/lipsum.dart' as lipsum;

main() {
  print("Generating random words: " + lipsum.createWord(numWords: 4));

  var sentence = lipsum.createSentence();

  print("\nGenerating a random sentence:\n\n" + sentence);

  var paragraph = lipsum.createParagraph();

  print("\nGenerating a random paragraph:\n\n" + paragraph);

  var text = lipsum.createText(numParagraphs: 3, numSentences: 5);

  print("\nGenerating a random text:\n\n" + text);
}