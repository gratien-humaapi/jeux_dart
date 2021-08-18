import 'dart:io';
import 'dart:math';

import 'classJoueur.dart';

class Jeu {
  int _credit = 0;
  int _counter = 0;
  int nombre = 0;
  bool _isWin = false;
  int _nombreJoueur = 0;
  int _nombreMatch = 0;
  int _tours = 0;
  int _interval = 0;
  List<Joueur> joueurs = [];

  Jeu(nombreJoueurJeu, creditJeu) {
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

  void main(int interval) {
    // Déclaration et initialisation du nombre aléatoire
    nombre = Random().nextInt(interval);
    _interval = interval;
    _playGame(); // Lancement du jeu

    _afficherScore(); // Affcihe le score du jeu
  }

  void _afficherScore() {
    var x = [];
    for (var i = 0; i < joueurs.length; i++) {
      x.add(joueurs[i].Score);
    }
    x.sort((a, b) => b - a);
    print('Nombre de Match : $_nombreMatch');
    print('Nom et Prenom   \t  Score  \t   Rang');
    for (var i = 0; i < _nombreJoueur; i++) {
      var rang = x.indexOf(joueurs[i].Score);
      stdout.write('${joueurs[rang].Prenom}  ${joueurs[rang].Nom} \t \t');
      stdout.write('${joueurs[rang].Score} \t \t');
      stdout.write('${i + 1}  \n');
    }
  }

  void _playGame() {
    var end = 'O';
    while (end.toUpperCase() == 'O') {
      _nombreMatch++;
      _counter = 1;
      _tours = joueurs.length * _credit;

      while (_counter != _tours && !_isWin) {
        _choixNombreAleatoire();
      }
      if (_counter == _tours && !_isWin) {
        print("Aucun des joueurs n'a gagné \n Le nombre était $nombre");
      }
      print('Voulez vous recommencer le jeu o pour oui n pour non');
      end = stdin.readLineSync()!;
      nombre = Random().nextInt(_interval);
      _isWin = false;
    }
  }

  void _choixNombreAleatoire() {
    var i = 0;
    var reprendre = true;
    var player = 1;
    while (reprendre) {
      print('Joueur $player: ${joueurs[player - 1].Prenom}');
      print('Deviner le nombre');
      var m = stdin.readLineSync();
      var dev = int.parse(m!);
      if (dev == nombre) {
        print(
            'Bravo joueur $player vous avez gagné \n Le nombre était $nombre');
        reprendre = false;
        _isWin = true;
        joueurs[player - 1].Score += 1;
      } else if (dev > _interval) {
        print("Vous avez dépassé l'intervalle");
      } else if (dev > nombre) {
        print("C'est moins que ce nombre");
      } else if (dev < nombre) {
        print("C'est plus que ce nombre");
      }
      print('Reessayer vous avez encore ${joueurs[i].Credit - 1} credit');
    }

    (player == joueurs.length) ? {player = 1, i++} : player = player + 1;

    if (_counter == _tours) {
      reprendre = false;
    } else {
      _counter = _counter + 1;
    }
  }
}
