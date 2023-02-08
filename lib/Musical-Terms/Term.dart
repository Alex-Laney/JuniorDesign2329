enum Tags {
  period,
  musicType,
  musicTheory
}
class Term {
  String name = "";
  String definition = "";
  List<String> examples = [];
  List<Tags> tags = [];

  Term(String n, String d, List<String> e, List<Tags> t) {
    name = n;
    definition = d;
    examples = e;
    tags = t;
  }

}