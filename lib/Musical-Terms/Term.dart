import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Definition-Page.dart';

enum Tags { period, musicType, musicTheory }

class Term {
  String name = "";
  List<String> defText;
  List<Term> defLinks;
  List<String> exText;
  List<Term> exLinks;
  List<Tags> tags = [];

  Term(
      {required this.name,
      required this.defText,
      required this.defLinks,
      required this.exText,
      required this.exLinks,
      required this.tags});

  int compareTag(Term target) {
    List<Term> temp = [];
    return tags[0].index.compareTo(target.tags[0].index);
  }

  int compareAlphabetically(Term target) {
    return name.compareTo(target.name);
  }

  OutlinedButton menuView(context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DefScreen(term: this)),
        );
      },
      child: Row(
        children: <Widget>[
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: Text(name),
          )),
          Align(alignment: Alignment.centerRight, child: Text(tags[0].name))
        ]));
  }

  SimpleDialog dialogView(context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.only(bottom: 100, left: 50, right: 50),
      children: <Widget>[
        Align(
            alignment: Alignment.topLeft,
            child: Text(name, style: const TextStyle(fontSize: 30))),
        Align(alignment: Alignment.center, child: getDefinition(context)),
        Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DefScreen(term: this)),
                );
              },
              child: const Text("More"),
            )),
      ],
    );
  }

  RichText getDefinition(BuildContext context) {
    if (defText.length == 1) {
      return RichText(
          text: TextSpan(
              text: "Definition: ${defText[0]}",
              style: const TextStyle(fontSize: 20, color: Colors.black)));
    }
    List<InlineSpan> children = <InlineSpan>[];
    for (int i = 1; i < defText.length; i++) {
      if (defLinks[i].name == "None") {
        children.add(TextSpan(text: " ${defText[i]}"));
      } else {
        children.add(TextSpan(
            text: " ${defText[i]}",
            style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return defLinks[i].dialogView(context);
                    });
              }));
      }
    }
    return RichText(
        text: TextSpan(
            text: "Definition: ${defText[0]}",
            style: const TextStyle(fontSize: 20, color: Colors.black),
            children: children));
  }

  RichText getExamples(BuildContext context) {
    if (exText.length == 1) {
      return RichText(
          text: TextSpan(
              text: "Examples:\n${exText[0]}",
              style: const TextStyle(fontSize: 20, color: Colors.black)));
    }
    List<InlineSpan> children = <InlineSpan>[];
    for (int i = 1; i < exText.length; i++) {
      if (exLinks[i].name == "None") {
        children.add(TextSpan(text: " ${exText[i]}"));
      } else {
        children.add(TextSpan(
            text: " ${exText[i]}",
            style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return exLinks[i].dialogView(context);
                    });
              }));
      }
    }
    return RichText(
        text: TextSpan(
            text: "Examples:\n ${exText[0]}",
            style: const TextStyle(fontSize: 20, color: Colors.black),
            children: children));
  }
}
