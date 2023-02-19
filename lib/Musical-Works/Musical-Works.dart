import 'package:flutter/material.dart';
import 'package:circular_menu/circular_menu.dart';
import 'dart:math' as math;

class WorksScreen extends StatelessWidget {
  const WorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style2 =
    TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20), foregroundColor: Colors.black);
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
    final List<String> entries = <String>['Mozart', 'Beethoven', 'Bach',
      'Mozart', 'Beethoven', 'Mozart', 'Beethoven', 'Mozart'];
    final List<int> colorCodes = <int>[500, 500, 500];

    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Classical Works'),
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 130.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Classical Works',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                )),
                  background:
                      Image.asset('assets/images/Gray.png',
                    fit: BoxFit.cover,
                  )
              ),
            ),
            // const SliverToBoxAdapter(
            //   child: SizedBox(
            //     height: 20,
            //     child: Center(
            //       child: Text('Scroll to see the SliverAppBar in effect.'),
            //     ),
            //   ),
            // ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.black12 : Colors.white,
                    height: 80.0,
                    child: Center(
                      child: TextButton(
                        style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Colors.black87)))),
                        onPressed: () {
                          /*
                           NOTE: The logic following this comment can be reworked such that you can use the conditional
                           to attribute the correct index to the correct music listening page for navigation
                           IE Mozart Song #2 is index 3 so 'if (index == 3) { Navigator etc '/mozart2listen'}
                           or something to that effect
                           */
                          index.isOdd ? Navigator.pushNamed(context, '/listen') : Navigator.pushNamed(context, '/listen');
                        },
                        child: Text('Composition by: ${entries[index]}'),
                      )
                    ),
                  );
                },
                childCount: 8,
              ),
            ),
          ],
        ),
      //
      //
      //
      //
      // ListView.separated(
        //   padding: const EdgeInsets.all(8),
        //   itemCount: entries.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       height: 50,
        //       color: Colors.amber[colorCodes[index]],
        //       child: Center(child: Text('Entry ${entries[index]}')),
        //     );
        //   },
        //   separatorBuilder: (BuildContext context, int index) => const Divider(),
        // ),
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
      ),
    );
  }
}
