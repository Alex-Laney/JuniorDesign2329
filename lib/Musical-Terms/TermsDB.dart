import 'package:artifact/Musical-Terms/Term.dart';


class TermsDB {
  static List<Term> backingList = [];

  //Declare terms here
  static Term allegro = Term("Allegro",
      "A brisk and lively tempo.",
      ["The tempo of Vivaldi's Spring is allegro."],
      [Tags.musicTheory]);
  static Term chord = Term("Chord",
      "A set of notes played simultaneously.",
      ["Chords are generally harmonious."],
      [Tags.musicTheory]);
  static Term classicalPeriod = Term("Classical Period",
      "The period from 1750-1820 with music characterized by elegance and order.",
      ["Mozart, Hayden, and early Beethoven were the most influential composers of the Classical period."],
      [Tags.period]);
  static Term concerto = Term("Concerto",
      "A composition in which one or more soloists are accompanied by an orchestra.",
      ["Concertos are often difficult for the soloist to preform."],
      [Tags.musicType]);
  static Term key = Term("Key",
      "The set of pitches that form the foundation of a piece of music.",
      ["Major keys sound happy while minor keys sound sad."],
      [Tags.musicTheory]);
  static Term movement = Term("Movement",
      "A music piece which is an independent portion of a larger classical composition.",
      ["It is proper etiquette to not clap between movements."],
      [Tags.musicTheory]);
  static Term requiem = Term("Requiem",
      "A piece composed for a Catholic Mass to honor the dead.",
      ["Mozart's Requiem was the last piece he composed before his own death."],
      [Tags.musicType]);
  static Term romanticPeriod = Term("Romantic Period",
      "The period from 1820-1900 when composers emphasized expressiveness and passion in their music.",
      ["Examples of composers in the Romantic period include Beethoven, Tchaikovsky, and Chopin."],
      [Tags.period]);
  static Term scale = Term("Scale",
      "A sequence of notes ordered by pitch.",
      ["Scales are the foundation of music."],
      [Tags.musicTheory]);
  static Term symphony = Term("Symphony",
      "A large scale musical piece with several movements usually composed for a full orchestra.",
      ["Beethoven's 5th is the most famous symphony."],
      [Tags.musicType]);



  static List<Term> initialize() {
    backingList.clear();

    //Add the terms to the database here
    backingList.add(allegro);
    backingList.add(chord);
    backingList.add(classicalPeriod);
    backingList.add(concerto);
    backingList.add(key);
    backingList.add(movement);
    backingList.add(requiem);
    backingList.add(romanticPeriod);
    backingList.add(scale);
    backingList.add(symphony);
    
    return backingList;
  }

  static List<Term> sortByTag() {
    for (int i = 0; i < backingList.length; i++) {
      for (int j = 0; j < backingList.length - 1; j++) {
        if (backingList[j].compareTag(backingList[j + 1]) > 0) {
          swapTerms(j, j + 1);
        }
      }
    }
    return backingList;
  }

  static void swapTerms(int a, int b) {
    Term temp = backingList[a];
    backingList[a] = backingList[b];
    backingList[b] = temp;
  }

}