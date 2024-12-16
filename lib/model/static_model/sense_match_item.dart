
import 'package:cooking_champs/constant/assets_path.dart';

class SenseMatchItem {
  final String word;
  final String answer;
  final String imagePath; // Path or Icon representing the word
  SenseMatchItem({required this.word,required this.answer, required this.imagePath});
}

 List<SenseMatchItem> items (){
  return [
  SenseMatchItem(word: 'Sight', imagePath:AssetsPath.lookImg4,answer:'Taste'),
    SenseMatchItem(word: 'Smell', imagePath:AssetsPath.lookImg5,answer: 'Hearing'),
SenseMatchItem(word: 'Hearing', imagePath: AssetsPath.lookImg1,answer: 'Sight'),

SenseMatchItem(word: 'Taste', imagePath:AssetsPath.lookImg2,answer:"Smell"),
SenseMatchItem(word: 'Touch', imagePath:AssetsPath.lookImg3,answer: 'Touch'),
];
}