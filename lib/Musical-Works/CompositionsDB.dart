import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:artifact/Musical-Works/Composition.dart';
import 'package:artifact/Musical-Terms/TermsDB.dart';

class CompsDB {
  static List<Comp> backingList = [];

  //Declare terms here
  static Comp none = Comp(
    name: "None",
    composer: [""],
    composerLinks: [],
    defText: [""],
    defLinks: [],
    genreText: [""],
    genreLinks: [],
  );
  static Comp fur = Comp(
      name: "Fur Elise",
      composer: ["Ludwig van Beethoven"],
      composerLinks: [none],
      defText: ["Placeholder text"],
      defLinks: [none],
      genreText: ["Fur Elise can be compared to other musical genres such as [x] and [y]."],
      genreLinks: [none]);
  static Comp moonlight = Comp(
      name: "Moonlight Sonata 1st Movement",
      composer: ["Ludwig van Beethoven"],
      composerLinks: [none],
      defText: ["Placeholder text"],
      defLinks: [none],
      genreText: ["Moonlight Sonata 1st Movement can be compared to other musical genres such as [x] and [y]."],
      genreLinks: [none]);
  static Comp sonataOne = Comp(
      name: "Sonata 1 in F Minor Allegro",
      composer: ["Ludwig van Beethoven"],
      composerLinks: [none],
      defText: ["Placeholder text"],
      defLinks: [none],
      genreText: ["Sonata 1 in F Minor Allegro can be compared to other musical genres such as [x] and [y]."],
      genreLinks: [none]);
  static Comp sonataEight = Comp(
      name: "Sonata 8 Pathetique 1st Movement",
      composer: ["Ludwig van Beethoven"],
      composerLinks: [none],
      defText: ["Placeholder text"],
      defLinks: [none],
      genreText: ["Sonata 8 Pathetique 1st Movement can be compared to other musical genres such as [x] and [y]."],
      genreLinks: [none]);

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
}