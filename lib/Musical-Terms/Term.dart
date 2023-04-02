import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Linkable Interface/linkable.dart';
import '../Linkable Interface/none_linkable.dart';
import 'Definition-Page.dart';

enum Tags { period, musicType, musicTheory }

class Term implements Linkable {
  String name = "";
  List<String> defText;
  List<Linkable> defLinks;
  List<String> exText;
  List<Linkable> exLinks;
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
          shadowColor: Color.fromRGBO(255, 0, 0, 0.45),
          elevation: 5,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DefScreen(term: this)),
          );
        },
        child: Row(children: <Widget>[
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
    List<InlineSpan> children = <InlineSpan>[];
    for (int i = 0; i < defText.length; i++) {
      if (defLinks[i].runtimeType == NoneLinkable) {
        children.add(TextSpan(text: " ${defText[i]}"));
      } else {
        children.add(TextSpan(
            text: " ${defText[i]}",
            style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                defLinks[i].link(context);
              }));
      }
    }
    return RichText(
        text: TextSpan(
            text: "Definition: ",
            style: const TextStyle(fontSize: 20, color: Colors.black),
            children: children));
  }

  RichText getExamples(BuildContext context) {
    List<InlineSpan> children = <InlineSpan>[];
    for (int i = 0; i < exText.length; i++) {
      if (exLinks[i].runtimeType == NoneLinkable) {
        children.add(TextSpan(text: " ${exText[i]}"));
      } else {
        children.add(TextSpan(
            text: " ${exText[i]}",
            style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                exLinks[i].link(context);
              }));
      }
    }
    return RichText(
        text: TextSpan(
            text: "Examples:\n ",
            style: const TextStyle(fontSize: 20, color: Colors.black),
            children: children));
  }

  @override
  void link(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialogView(context);
        });
  }
}
