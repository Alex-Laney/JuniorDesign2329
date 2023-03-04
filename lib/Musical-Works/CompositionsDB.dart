import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artifact/Musical-Works/Composition.dart';

class CompsDB {
  static List<Comp> backingList = [];

  //Declare terms here
  static Comp none = Comp(
    name: "None",
    defText: [""],
    defLinks: [],
    exText: [""],
    exLinks: [],
  );
  static Comp fur = Comp(
      name: "Fur Elise",
      defText: ["The first composition."],
      defLinks: [none],
      exText: ["Beethoven."],
      exLinks: [none]);
  static Comp moonlight = Comp(
      name: "Moonlight Sonata 1st Movement",
      defText: ["The second composition."],
      defLinks: [none],
      exText: ["Beethoven."],
      exLinks: [none]);
  static Comp sonataOne = Comp(
      name: "Sonata 1 in F Minor Allegro",
      defText: ["The third composition."],
      defLinks: [none],
      exText: ["Beethoven."],
      exLinks: [none]);
  static Comp sonataEight = Comp(
      name: "Sonata 8 Pathetique 1st Movement",
      defText: ["The fourth composition."],
      defLinks: [none],
      exText: ["Beethoven."],
      exLinks: [none]);

  static List<Comp> initialize() {
    backingList.clear();

    //Add the terms to the database here
    backingList.add(fur);
    backingList.add(moonlight);
    backingList.add(sonataOne);
    backingList.add(sonataEight);

    return backingList;
  }

  static List<Comp> getBackingList() {
    return backingList;
  }

  static List<Comp> sortAlphabetically() {
    for (int i = 0; i < backingList.length; i++) {
      for (int j = 0; j < backingList.length - 1; j++) {
        if (backingList[j].compareAlphabetically(backingList[j + 1]) > 0) {
          swapComps(j, j + 1);
        }
      }
    }
    return backingList;
  }

  static List<Comp> sortReverseAlphabetically() {
    for (int i = 0; i < backingList.length; i++) {
      for (int j = 0; j < backingList.length - 1; j++) {
        if (backingList[j].compareAlphabetically(backingList[j + 1]) < 0) {
          swapComps(j, j + 1);
        }
      }
    }
    return backingList;
  }

  static void swapComps(int a, int b) {
    Comp temp = backingList[a];
    backingList[a] = backingList[b];
    backingList[b] = temp;
  }
}
