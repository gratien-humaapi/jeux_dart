import 'dart:io';
import 'package:jeux/classJeu.dart';

void main() {
  // machin(10, 2, 3);

  print('Entrer le nombre de joueurs');
  var n = stdin.readLineSync();
  print('Entrer la valeur max du nombre aleatoire');
  var l = stdin.readLineSync();
  print('Entrer le nombre de credit');
  var c = stdin.readLineSync();

  var jeux = Jeu(int.parse(l!), int.parse(n!), int.parse(c!));

  jeux.listJoueur();

  jeux.machin(int.parse(l));
}
