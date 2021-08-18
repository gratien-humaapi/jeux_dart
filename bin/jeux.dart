import 'dart:io';
import 'package:jeux/classJeu.dart';

void main() {
  // machin(10, 2, 3);

  print('Entrer le nombre de joueurs');
  var nombreJoueur = stdin.readLineSync();
  print('Entrer la valeur max du nombre aleatoire');
  var nombreMax = stdin.readLineSync();
  print('Entrer le nombre de credit');
  var nombreCredit = stdin.readLineSync();

  var jeux = Jeu(int.parse(nombreJoueur!), int.parse(nombreCredit!));

  jeux.listJoueur();

  jeux.main(int.parse(nombreMax!));
}
