import 'package:artifact/Musical-Works/Composition.dart';
import 'package:artifact/Musical-Terms/TermsDB.dart';
import '../Linkable Interface/none_linkable.dart';

class CompsDB {
  static List<Comp> backingList = [];

  //Declare terms here
  static NoneLinkable none = NoneLinkable();
  static Comp fur = Comp(
      name: "Für Elise",
      composer: ["Ludwig van Beethoven"],
      composerLinks: [none],
      desText: ["Für Elise translates to “For Elise.” Who is this Elise, and "
          "why did Beethoven write it for her? Despite when Für Elise was "
          "written, it is an integral piece to the early part of the",
        "Romantic Period.", "Ludwig van Beethoven wrote it in the", "key",
        "of A Minor, which gives it a sad feeling."],
      desLinks: [none, TermsDB.romanticPeriod, none, TermsDB.key, none],
      genreText: ["Für Elise makes use of a musical structure called rondo."
          " Rondo has been used to compose songs in other genres as well as "
          "other time periods. The song Every Breath You Take by the Police "
          "utilizes rondo. Its genre can be viewed as Pop, and it is a ballad, "
          "similar to Für Elise."],
      genreLinks: [none]);
  static Comp moonlight = Comp(
      name: "Moonlight Sonata 1st Movement",
      composer: ["Ludwig van Beethoven"],
      composerLinks: [none],
      desText: ["The Moonlight Sonata was given its name by critics of the "
          "piece years after it had been written. Its original name given to "
          "it by Ludwig van Beethoven was Piano Sonata No. 14. It was written "
          "in the", "key", "of C-sharp minor. It has three", "movements", "the "
          "first one is able to be listened to here. This first movement was "
          "written in the form of an Allegro sonata."],
      desLinks: [none, TermsDB.key, none, TermsDB.movement, none],
      genreText: ["The Moonlight Sonata is, of course, a sonata. The sonata "
  "has persisted into the modern day and through various genres. One such "
  "genre is the genre of rock. Some early 2000s rock compositions will utilize"
      " the form of the sonata through its opening, middle and end."],
      genreLinks: [none]);
  static Comp sonataOne = Comp(
      name: "Sonata 1 in F Minor Allegro",
      composer: ["Ludwig van Beethoven"],
      composerLinks: [none],
      desText: ["Sonata 1 in F Minor Allegro is the first", "movement", "of "
          "Ludwig van Beethoven's Piano Sonata No. 1. You could say it is the"
          " first movement of the first sonata. It was written in the", "key",
          "of F minor. This gives it a strained and distressed feeling."],
      desLinks: [none, TermsDB.movement, none, TermsDB.key, none],
      genreText: ["This movement's", "key", "of F minor is commonly utilized "
          "in the electronic genre of music. This genre of music utilizes "
          "peaks and valleys. It requires a key that would be flexible enough "
          "for distressing valleys that lead to satisfying peaks. Beethoven "
          "utilized it in some of his sonatas for the same purpose."],
      genreLinks: [none, TermsDB.key, none]);
  static Comp pathetique = Comp(
      name: "Sonata 8 Pathetique 1st Movement",
      composer: ["Ludwig van Beethoven"],
      composerLinks: [none],
      desText: ["Ludwig van Beethoven's eighth piano sonata is commonly "
          "referred to as Sonata Pathétique. The sonata was written in the",
        "key", "of C minor. This first", "movement", "of the sonata is "
            "written", "allegro.", "Note that Pathétique does not mean "
            "“pathetic,” but rather “passionate” or “emotional.”"],
      desLinks: [none, TermsDB.key, none, TermsDB.movement, none,
        TermsDB.allegro, none],
      genreText: ["Pathétique's usage of the common C minor", "key", "allows "
          "it to be connected to various other genres of music. A clear line "
          "that can be drawn is to jazz music. The ease of access that C minor "
          "allows as far as bringing a song some depth and perhaps a sense of "
          "longing allows various jazz songs to slip into this key. One such "
          "popular example is Mr. P.C. by John Coltrane which is almost "
          "entirely in the C minor key."],
      genreLinks: [none, TermsDB.key, none]);

  static List<Comp> initialize() {
    backingList.clear();

    //Add the terms to the database here
    backingList.add(fur);
    backingList.add(moonlight);
    backingList.add(sonataOne);
    backingList.add(pathetique);

    return backingList;
  }

  static List<Comp> getBackingList() {
    return backingList;
  }
}