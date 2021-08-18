class Joueur {
  Map donneeJoueur = {
    'prenom': '',
    'nom': '',
    'age': 18,
    'score': 0,
    'credit': 0
  };
  Joueur(prenomJoueur, nomJoueur, ageJoueur, creditJoueur) {
    donneeJoueur['prenom'] = prenomJoueur;
    donneeJoueur['nom'] = nomJoueur;
    donneeJoueur['age'] = ageJoueur;
    donneeJoueur['credit'] = creditJoueur;
  }
  set Prenom(prenom) {
    donneeJoueur['prenom'] = prenom;
  }

  String get Prenom {
    return donneeJoueur['prenom'];
  }

  set Nom(nom) {
    donneeJoueur['nom'] = nom;
  }

  String get Nom {
    return donneeJoueur['nom'];
  }

  set Age(age) {
    donneeJoueur['age'] = age;
  }

  int get Age {
    return donneeJoueur['age'];
  }

  set Score(score) {
    donneeJoueur['score'] = score;
  }

  int get Score {
    return donneeJoueur['score'];
  }

  set Credit(credit) {
    donneeJoueur['credit'] = credit;
  }

  int get Credit {
    return donneeJoueur['credit'];
  }
}
