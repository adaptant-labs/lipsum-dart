import 'package:lorem/lorem.dart';

main() {
  Lorem lorem = Lorem();

  var sentence = lorem.createSentence();

  print("Generating a random sentence:\n\n" + sentence);

  var paragraph = lorem.createParagraph();

  print("\nGenerating a random paragraph:\n\n" + paragraph);

  var text = lorem.createText(numParagraphs: 3, numSentences: 5);

  print("\nGenerating a random text:\n\n" + text);
}