import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

/// Ignore this class file (not in use)
class WorksScreen extends StatelessWidget {
  const WorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style2 = TextButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        foregroundColor: Colors.black);
    final List<String> entries = <String>[
      'Beethoven',
      'Beethoven',
      'Beethoven',
      'Beethoven',
      'Beethoven',
      'Beethoven',
      'Beethoven',
      'Beethoven'
    ];
    final List<int> colorCodes = <int>[500, 500, 500];

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Classical Works'),
      // ),
      backgroundColor: const Color.fromRGBO(196, 236, 249, 1),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 130.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Classical Works',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
              ),
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
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.black87),
                          ),
                        ),
                      ),
                      onPressed: () {
                        /*
                           NOTE: The logic following this comment can be reworked such that you can use the conditional
                           to attribute the correct index to the correct music listening page for navigation
                           IE Mozart Song #2 is index 3 so 'if (index == 3) { Navigator etc '/mozart2listen'}
                           or something to that effect
                           */
                        index.isOdd
                            ? Navigator.pushNamed(context, '/listen')
                            : Navigator.pushNamed(context, '/listen');
                      },
                      child: Text('Composition by: ${entries[index]}'),
                    ),
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
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
    );
  }
}
