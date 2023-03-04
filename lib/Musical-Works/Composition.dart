import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Composition-Page.dart';

class Comp {
  String name = "";
  List<String> composer;
  List<Comp> composerLinks;
  List<String> defText;
  List<Comp> defLinks;
  List<String> genreText;
  List<Comp> genreLinks;

  Comp(
      {required this.name,
      required this.composer,
      required this.composerLinks,
        required this.defText,
        required this.defLinks,
        required this.genreText,
      required this.genreLinks});

  int compareAlphabetically(Comp target) {
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
          MaterialPageRoute(builder: (context) => CompScreen(comp: this)),
        );
      },
      child: Row(
        children: <Widget>[
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: Text(name),
          )),
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
        Align(alignment: Alignment.center, child: getComposer(context)),
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
                      builder: (context) => CompScreen(comp: this)),
                );
              },
              child: const Text("More"),
            )),
      ],
    );
  }

  RichText getComposer(BuildContext context) {
    if (composer.length == 1) {
      return RichText(
          text: TextSpan(
              text: "Composer: ${composer[0]}",
              style: const TextStyle(fontSize: 20, color: Colors.black)));
    }
    List<InlineSpan> children = <InlineSpan>[];
    for (int i = 1; i < composer.length; i++) {
      if (composerLinks[i].name == "None") {
        children.add(TextSpan(text: " ${composer[i]}"));
      } else {
        children.add(TextSpan(
            text: " ${composer[i]}",
            style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return composerLinks[i].dialogView(context);
                    });
              }));
      }
    }
    return RichText(
        text: TextSpan(
            text: "Composer: ${composer[0]}",
            style: const TextStyle(fontSize: 20, color: Colors.black),
            children: children));
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
      if (composerLinks[i].name == "None") {
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
    if (genreText.length == 1) {
      return RichText(
          text: TextSpan(
              text: "Genre Comparisons:\n${genreText[0]}",
              style: const TextStyle(fontSize: 20, color: Colors.black)));
    }
    List<InlineSpan> children = <InlineSpan>[];
    for (int i = 1; i < genreText.length; i++) {
      if (genreLinks[i].name == "None") {
        children.add(TextSpan(text: " ${genreText[i]}"));
      } else {
        children.add(TextSpan(
            text: " ${genreText[i]}",
            style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return genreLinks[i].dialogView(context);
                    });
              }));
      }
    }
    return RichText(
        text: TextSpan(
            text: "Genre Comparisons:\n ${genreText[0]}",
            style: const TextStyle(fontSize: 20, color: Colors.black),
            children: children));
  }
}
