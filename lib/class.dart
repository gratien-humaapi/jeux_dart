import 'dart:io';
import 'dart:math';

class Joueur {
  var p_Name = [];
  var age = [];
  int credit = 0;
  var score_Cumul = [];
// x joueur name , y age , z nombre de crédit
  // Joueur(x, y, z) {
  //   p_Name = x;
  //   age = y;
  //   credit = z;
  // }
  set Name(name) {
    p_Name = name;
  }

  List get Name {
    return p_Name;
  }

  set Age(j_Age) {
    age = j_Age;
  }

  List get Age {
    return age;
  }

  set Credit(c) {
    credit = c;
  }

  int get Credit {
    return credit;
  }
}

class Jeu extends Joueur {
  var interval = 0;
  var nombre = 0;
  var n_Joueur = 0;
  Jeu(l, n) {
    interval = l;
    n_Joueur = n;
  }
  set Interval(c) {
    interval = c;
  }

  int get Interval {
    return interval;
  }

  set Nombre(nbr) {
    nombre = Random().nextInt(interval);
  }

  int get Nombre {
    return nombre;
  }

  set N_joueur(player) {
    n_Joueur = player;
  }

  int get N_joueur {
    return n_Joueur;
  }

  void list_Joueur() {
    for (var i = 1; i <= n_Joueur; i++) {
      print('Joueur $i Entrer votre nom et Prenom');
      var input = stdin.readLineSync();
      p_Name.add(input);
      print('Joueur $i Entrer votre age');
      var x = stdin.readLineSync();
      age.add(int.parse(x!));
    }
  }

  void machin(int interval, int credit) {
    super.score_Cumul = [for (var i = 0; i < p_Name.length; i++) 0];
    // Déclaration et initialisation du nombre de joueurs
    var _j = p_Name;
    // Déclaration et initialisation du crédit
    var _n = credit;
    // Déclaration et initialisation de l'intervalle
    var _a = interval;
    // Déclaration et initialisation du nombre aléatoire
    var nombre_Match = 0;
    var end = 'o';
    while (end == 'o' || end == 'O') {
      nombre_Match = nombre_Match + 1;
      var reprendre = true;
      var win = 0;
      var value = _j.length;
      var counter = 1;
      var tours = _j.length * _n;
      var player = 1;

      while (counter != tours && win == 0) {
        var i = 1;

        while (reprendre == true) {
          print('Joueur $player: ${_j[player - 1]}');
          print('Deviner le nombre');
          var m = stdin.readLineSync();
          var dev = int.parse(m!);
          if (dev == nombre) {
            print(
                'Bravo joueur $player vous avez gagné \n Le nombre était $nombre');
            reprendre = false;
            win = 1;
            score_Cumul[player - 1]++;
            nombre = Random().nextInt(interval);
          } else {
            if (dev > _a) {
              print("Vous avez dépassé l'intervalle");
            } else if (dev > nombre) {
              print("C'est moins que ce nombre");
            } else {
              print("C'est plus que ce nombre");
            }
            print('Reessayer vous avez encore ${_n - i} credit');
          }
          (player == value) ? {player = 1, i++} : player = player + 1;

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
    for (var i in score_Cumul) {
      x.add(i);
    }
    x.sort((a, b) => b - a);
    print('Nombre de Match $nombre_Match');
    print('Joueur  \t  Score \t Rang ');
    for (var i = 0; i < n_Joueur; i++) {
      stdout.write('${p_Name[i]} \t \t');
      stdout.write('${score_Cumul[i]} \t \t');
      stdout.write('${x.indexOf(score_Cumul[i]) + 1} \n');
    }
  }
}
