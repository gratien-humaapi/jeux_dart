import 'dart:io';
import 'dart:math';
import 'package:jeux/class.dart';

void main() {
  // machin(10, 2, 3);

  print('Entrer le nombre de joueur');
  var n = stdin.readLineSync();
  print('Entrer le valeur max du nombre aleatoire');
  var l = stdin.readLineSync();
  print('Entrer le nombre de credit');
  var c = stdin.readLineSync();
  var jeux = Jeu(int.parse(l!), int.parse(n!));
  jeux.list_Joueur();
  jeux.machin(int.parse(l), int.parse(c!));
}
