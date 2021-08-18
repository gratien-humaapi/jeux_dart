import 'dart:io';
import 'dart:math';

import 'classJoueur.dart';

class Jeu {
  int interval = 0;
  int _credit = 0;
  int nombre = 0;
  int _nombreJoueur = 0;
  List<Joueur> joueurs = [];

  Jeu(intervalJeu, nombreJoueurJeu, creditJeu) {
    interval = intervalJeu;
    _nombreJoueur = nombreJoueurJeu;
    _credit = creditJeu;
  }
  void NewPlayer(prenomJoueur, nomJoueur, ageJoueur, creditJoueur) {
    var p = Joueur(prenomJoueur, nomJoueur, ageJoueur, _credit);
    joueurs.add(p);
  }

  set Nombre(nbr) {
    nombre = nbr;
  }

  int get Nombre {
    return nombre;
  }

  void listJoueur() {
    for (var i = 1; i <= _nombreJoueur; i++) {
      print('Joueur $i entrer votre Prenom');
      var prenom = stdin.readLineSync();

      print('Joueur $i entrer votre Nom');
      var nom = stdin.readLineSync();

      print('Joueur $i entrer votre age');
      var age = stdin.readLineSync();
      NewPlayer(prenom, nom, int.parse(age!), _credit);
    }
  }

  void machin(int interval) {
    nombre = Random().nextInt(interval);
    // Déclaration et initialisation du nombre aléatoire
    var nombre_Match = 0;
    var end = 'o';
    while (end == 'o' || end == 'O') {
      nombre_Match = nombre_Match + 1;
      var reprendre = true;
      var win = 0;
      var counter = 1;
      var tours = joueurs.length * _credit;
      var player = 1;

      while (counter != tours && win == 0) {
        var i = 0;

        while (reprendre == true) {
          print('Joueur $player: ${joueurs[player - 1].Prenom}');
          print('Deviner le nombre');
          var m = stdin.readLineSync();
          var dev = int.parse(m!);
          if (dev == nombre) {
            print(
                'Bravo joueur $player vous avez gagné \n Le nombre était $nombre');
            reprendre = false;
            win = 1;
            joueurs[player - 1].Score += 1;
            nombre = Random().nextInt(interval);
          } else {
            if (dev > interval) {
              print("Vous avez dépassé l'intervalle");
            } else if (dev > nombre) {
              print("C'est moins que ce nombre");
            } else {
              print("C'est plus que ce nombre");
            }
            print('Reessayer vous avez encore ${joueurs[i].Credit - 1} credit');
          }
          (player == joueurs.length) ? {player = 1, i++} : player = player + 1;

          if (counter == tours) {
            reprendre = false;
          } else {
            counter = counter + 1;
          }
        }
      }
      if (counter == tours && win == 0) {
        print("Aucun des joueurs n'a gagné \n Le nombre était $nombre");
      }
      print('Voulez vous recommencer le jeu o pour oui n pour non');
      end = stdin.readLineSync()!;
    }
    var x = [];
    for (var i = 0; i < joueurs.length; i++) {
      x.add(joueurs[i].Score);
    }
    x.sort((a, b) => b - a);
    print('Nombre de Match : $nombre_Match');
    print('Nom et Prenom   \t  Score  \t   Rang');
    for (var i = 0; i < _nombreJoueur; i++) {
      var rang = x.indexOf(joueurs[i].Score);
      stdout.write('${joueurs[rang].Prenom}  ${joueurs[rang].Nom} \t \t');
      stdout.write('${joueurs[rang].Score} \t \t');
      stdout.write('${i + 1}  \n');
    }
  }
}
