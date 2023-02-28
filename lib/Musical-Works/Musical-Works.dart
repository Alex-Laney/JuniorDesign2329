import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';

class WorksScreen extends StatelessWidget {
  const WorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style2 =
    TextButton.styleFrom(textStyle: const TextStyle(fontSize: 20), foregroundColor: Colors.black);
    final List<String> entries = <String>['Fur Elise', 'Moonlight Sonata 1st Movement', 'Sonata 1 in F Minor Allegro', 'Sonata 8 Pathetique 1st Movement'];
    final List<int> colorCodes = <int>[500, 500, 500];

    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Classical Works'),
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
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
                  )
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
                        style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: const BorderSide(color: Colors.black87)))),
                        onPressed: () {
                          if(index < 1) {
                            Navigator.pushNamed(context, '/furElise');
                          } else {
                            Navigator.pushNamed(context, '/listen');
                          }
                          /*
                           NOTE: The logic above this comment can be reworked such that you can use the conditional
                           to attribute the correct index to the correct music listening page for navigation
                           IE Mozart Song #2 is index 3 so 'if (index == 3) { Navigator etc '/mozart2listen'}
                           or something to that effect
                           */
                        },
                        child: Text(entries[index]),
                      )
                    ),
                  );
                },
                childCount: 4,
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
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              tooltip: 'Settings',
              icon: const Icon(Icons.settings, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}
