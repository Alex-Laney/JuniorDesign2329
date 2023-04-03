import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Composition-Page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Linkable Interface/linkable.dart';
import '../Linkable Interface/none_linkable.dart';

class Comp implements Linkable {
  String name = "";
  List<String> composer;
  List<Linkable> composerLinks;
  List<String> desText;
  List<Linkable> desLinks;
  List<String> genreText;
  List<Linkable> genreLinks;

  Comp(
      {required this.name,
      required this.composer,
      required this.composerLinks,
      required this.desText,
      required this.desLinks,
      required this.genreText,
      required this.genreLinks});

  int compareAlphabetically(Comp target) {
    return name.compareTo(target.name);
  }

  OutlinedButton menuView(context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          shadowColor: Color.fromRGBO(0, 247, 255, 0.45),
          elevation: 5,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CompScreen(comp: this)),
          );
        },
        child: Row(children: <Widget>[
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
    List<InlineSpan> children = <InlineSpan>[];
    for (int i = 0; i < composer.length; i++) {
      if (composerLinks[i].runtimeType == NoneLinkable) {
        children.add(TextSpan(text: " ${composer[i]}"));
      } else {
        children.add(TextSpan(
            text: " ${composer[i]}",
            style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                composerLinks[i].link(context);
              }));
      }
    }
    return RichText(
        text: TextSpan(
            text: "Composer: ",
            style: const TextStyle(fontSize: 20, color: Colors.black),
            children: children));
  }

  RichText getDescription(BuildContext context) {
    List<InlineSpan> children = <InlineSpan>[];
    for (int i = 0; i < desText.length; i++) {
      if (desLinks[i].runtimeType == NoneLinkable) {
        children.add(TextSpan(text: " ${desText[i]}"));
      } else {
        children.add(TextSpan(
            text: " ${desText[i]}",
            style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                desLinks[i].link(context);
              }));
      }
    }
    return RichText(
        text: TextSpan(
            text: "Description: ",
            style: const TextStyle(fontSize: 20, color: Colors.black),
            children: children));
  }

  RichText getExamples(BuildContext context) {
    List<InlineSpan> children = <InlineSpan>[];
    for (int i = 0; i < genreText.length; i++) {
      if (genreLinks[i].runtimeType == NoneLinkable) {
        children.add(TextSpan(text: " ${genreText[i]}"));
      } else {
        children.add(TextSpan(
            text: " ${genreText[i]}",
            style: const TextStyle(fontSize: 20, color: Colors.lightBlue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                genreLinks[i].link(context);
              }));
      }
    }
    return RichText(
        text: TextSpan(
            text: "Genre Comparisons: ",
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
