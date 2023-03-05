import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artifact/Musical-Terms/Term.dart';

import '../Linkable Interface/linkable.dart';
import '../Linkable Interface/none_linkable.dart';

class TermsDB {
  static List<Term> backingList = [];

  //Declare terms here
  static NoneLinkable none = NoneLinkable();
  static Term allegro = Term(
      name: "Allegro",
      defText: ["A brisk and lively tempo."],
      defLinks: [none],
      exText: ["The tempo of Vivaldi's Spring is allegro."],
      exLinks: [none],
      tags: [Tags.musicTheory]);
  static Term chord = Term(
      name: "Chord",
      defText: ["A set of notes played simultaneously."],
      defLinks: [none],
      exText: ["Chords are generally harmonious."],
      exLinks: [none],
      tags: [Tags.musicTheory]);
  static Term classicalPeriod = Term(
      name: "Classical Period",
      defText: ["The period from 1750-1820 with music characterized by elegance and order."],
      defLinks: [none],
      exText: ["Mozart, Hayden, and early Beethoven were the most influential composers of the Classical period."],
      exLinks: [none],
      tags: [Tags.period]);
  static Term concerto = Term(
      name: "Concerto",
      defText: ["A composition in which one or more soloists are accompanied by an orchestra."],
      defLinks: [none],
      exText: ["Concertos are often difficult for the soloist to preform."],
      exLinks: [none],
      tags: [Tags.musicType]);
  static Term key = Term(
      name: "Key",
      defText: ["The set of pitches that form the foundation of a piece of music."],
      defLinks: [none],
      exText: ["Major keys sound happy while minor keys sound sad."],
      exLinks: [none],
      tags: [Tags.musicTheory]);
  static Term movement = Term(
      name: "Movement",
      defText: ["A music piece which is an independent portion of a larger", "classical", "composition."],
      defLinks: [none, classicalPeriod, none],
      exText: ["It is proper etiquette to not clap between movements."],
      exLinks: [none],
      tags: [Tags.musicTheory]);
  static Term requiem = Term(
      name: "Requiem",
      defText: ["A piece composed for a Catholic Mass to honor the dead."],
      defLinks: [none],
      exText: ["Mozart's Requiem was the last piece he composed before his own death."],
      exLinks: [none],
      tags: [Tags.musicType]);
  static Term romanticPeriod = Term(
      name: "Romantic Period",
      defText: ["The period from 1820-1900 when composers emphasized expressiveness and passion in their music."],
      defLinks: [none],
      exText: ["Examples of composers in the Romantic period include Beethoven, Tchaikovsky, and Chopin."],
      exLinks: [none],
      tags: [Tags.period]);
  static Term scale = Term(
      name: "Scale",
      defText: ["A sequence of notes ordered by pitch."],
      defLinks: [none],
      exText: ["Scales are the foundation of music."],
      exLinks: [none],
      tags: [Tags.musicTheory]);
  static Term symphony = Term(
      name: "Symphony",
      defText: ["A large scale musical piece with several", "movements", "usually composed for a full orchestra."],
      defLinks: [none, movement, none],
      exText: ["Beethoven's 5th is the most famous symphony."],
      exLinks: [none],
      tags: [Tags.musicType]);

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

  static List<Term> getBackingList() {
    return backingList;
  }

  static List<Term> sortAlphabetically() {
    for (int i = 0; i < backingList.length; i++) {
      for (int j = 0; j < backingList.length - 1; j++) {
        if (backingList[j].compareAlphabetically(backingList[j + 1]) > 0) {
          swapTerms(j, j + 1);
        }
      }
    }
    return backingList;
  }

  static List<Term> sortReverseAlphabetically() {
    for (int i = 0; i < backingList.length; i++) {
      for (int j = 0; j < backingList.length - 1; j++) {
        if (backingList[j].compareAlphabetically(backingList[j + 1]) < 0) {
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
