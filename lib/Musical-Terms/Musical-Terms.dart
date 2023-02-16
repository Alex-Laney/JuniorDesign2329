import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';
import 'dart:math' as math;
import 'package:artifact/Musical-Terms/Term.dart';
import 'package:artifact/Musical-Terms/TermsDB.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  TermsScreenState createState() => TermsScreenState();
}

class TermsScreenState extends State<TermsScreen> {
  String dropdownVal = 'A-Z';

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String sort in ['A-Z', 'Z-A', 'Tags']) {
      items.add(DropdownMenuItem(value: sort, child: Text(sort)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    final int iconColor = 300;

    // returns the circular spanning button for module selection
    CircularMenu buildCircularDialMainMenu() {
      return CircularMenu(
        toggleButtonBoxShadow: const [],
        startingAngleInRadian: 7 * math.pi / 6,
        endingAngleInRadian: 11 * math.pi / 6,
        items: [
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.yellow[iconColor],
            icon: Icons.person,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/composers'),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.blue[iconColor],
            icon: Icons.music_note,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/works'),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.green[iconColor],
            icon: Icons.quiz,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/quizzes'),
          ),
          CircularMenuItem(
            boxShadow: const [],
            color: Colors.red[iconColor],
            icon: Icons.book,
            iconColor: Colors.black,
            onTap: () => Navigator.pushNamed(context, '/terms'),
          ),
        ],
      );
    }

    return Scaffold(
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(children: <Widget>[
                const SizedBox(width: 125),
                const Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Text('Terms', style: TextStyle(fontSize: 40)),
                )),
                Container(
                  width: 100,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: DropdownButton<String>(
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownVal = newValue!;
                          });
                        },
                        value: dropdownVal,
                        icon: const Icon(Icons.arrow_downward),
                        items: getDropdownItems(),
                      )),
                ),
                const SizedBox(width: 25),
              ]),
              Row(children: const <Widget>[
                SizedBox(width: 25),
                Expanded(
                    child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Term"),
                )),
                Align(alignment: Alignment.centerRight, child: Text("Tags")),
                SizedBox(width: 25),
              ]),
              ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20.0),
                  itemCount: TermsDB.initialize().length,
                  itemBuilder: (context, position) {
                    return TermsDB.backingList[position].menuView(context);
                  }),
            ],
          )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: buildCircularDialMainMenu(),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                tooltip: 'Home',
                icon: const Icon(Icons.home, color: Colors.black45),
              ),
              IconButton(
                onPressed: () {},
                tooltip: 'Settings',
                icon: const Icon(Icons.settings, color: Colors.black45),
              ),
            ],
          ),
        ));
  }
}
