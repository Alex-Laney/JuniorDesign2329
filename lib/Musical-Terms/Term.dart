import 'package:flutter/material.dart';
import 'Definition-Page.dart';

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

  int compareAlphabetically(Term target) {
    return name.compareTo(target.name);
  }

  OutlinedButton menuView(context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DefScreen(term: this)),
        );
      },
      child: Row(
          children: <Widget>[Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(this.name),
              )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(this.tags[0].name)
          )
        ]
      )
    );
  }

}