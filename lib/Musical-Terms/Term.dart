import 'package:flutter/material.dart';

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

  OutlinedButton menuView() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(textStyle: const TextStyle(fontSize: 20), ),
      onPressed: () {
        //Navigator.pushNamed(context, '/terms');
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