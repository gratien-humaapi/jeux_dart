import 'dart:io';

import 'dart:math';

void machin(int intervalEnd, int gamePlayer, int credit) {
  // Déclaration et initialisation du nombre de joueurs
  var _j = gamePlayer;
  // Déclaration et initialisation du crédit
  var _n = credit;
  // Déclaration et initialisation de l'intervalle
  var _a = intervalEnd;
  // Déclaration et initialisation du nombre aléatoire
  var nombre = Random().nextInt(_a);
  var reprendre = true;
  var win = 0;
  var counter = 1;
  var tours = _j * _n;
  var player = 1;

  while (counter != tours && win == 0) {
    var i = 1;

    while (reprendre == true) {
      print('Joueur $player');
      print('Deviner le nombre');
      var m = stdin.readLineSync();
      var dev = int.parse(m!);
      if (dev == nombre) {
        print('Bravo joueur $player vous avez gagné');
        reprendre = false;
        win = 1;
      } else {
        if (dev > _a) {
          print("Vous avez dépassé l'intervalle");
        } else if (dev > nombre) {
          print("C'est plus que le nombre");
        } else {
          print("C'est moins que le nombre");
        }
        print('Reessayer vous avez encore ${_n - i} credit');
      }
      (player == _j) ? {player = 1, i++} : player = player + 1;
      counter++;
      if (counter == tours) {
        reprendre = false;
      }
    }
  }
  if (counter == tours) {
    print("Aucun des joueurs n'a gagné");
  }
}
