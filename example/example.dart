import 'package:lipsum/lipsum.dart' as lipsum;

main() {
  var sentence = lipsum.createSentence();

  print("Generating a random sentence:\n\n" + sentence);

  var paragraph = lipsum.createParagraph();

  print("\nGenerating a random paragraph:\n\n" + paragraph);

  var text = lipsum.createText(numParagraphs: 3, numSentences: 5);

  print("\nGenerating a random text:\n\n" + text);
}