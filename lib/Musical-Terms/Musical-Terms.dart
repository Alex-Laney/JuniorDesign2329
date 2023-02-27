import 'package:flutter/material.dart';
import 'package:artifact/Musical-Terms/Term.dart';
import 'package:artifact/Musical-Terms/TermsDB.dart';
import 'package:artifact/circular_dial_menu.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  TermsScreenState createState() => TermsScreenState();
}

class TermsScreenState extends State<TermsScreen> {
  late String dropdownVal = 'A-Z';
  late List<Term> backingList = TermsDB.initialize();

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String sort in ['A-Z', 'Tags']) {
      items.add(DropdownMenuItem(value: sort, child: Text(sort)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 199, 199, 1),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 125),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Terms', style: TextStyle(fontSize: 40)),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: DropdownButton<String>(
                            onChanged: (String? newValue) {
                              setState(
                                () {
                                  print(backingList[0].name);
                                  dropdownVal = newValue!;
                                  if (newValue == 'A-Z') {
                                    backingList = TermsDB.initialize();
                                    print('A-Z\n$newValue');
                                  } else {
                                    backingList = TermsDB.sortByTag();
                                    print('Tags\n$newValue');
                                  }
                                  print(backingList[0].name);
                                },
                              );
                            },
                            value: dropdownVal,
                            icon: const Icon(Icons.arrow_downward),
                            items: getDropdownItems(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                    ],
                  ),
                  Row(
                    children: const <Widget>[
                      SizedBox(width: 25),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Term"),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text("Tags")),
                      SizedBox(width: 25),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(20.0),
                    itemCount: backingList.length,
                    itemBuilder: (context, position) {
                      return backingList[position].menuView(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
