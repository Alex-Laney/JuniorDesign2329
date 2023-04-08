import 'package:flutter/material.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';

class MozartScreen extends StatelessWidget {
  const MozartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 246, 167, 1),
      appBar: AppBar(
        title: const Text('Mozart'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/images/Mozart.png'),
              const Text(
                'Early Life',
                style: TextStyle(fontSize: 32),
              ),
              const Text(
                'Wolfgang Amadeus Mozart was born on January 27, 1756, in Salzburg, Austria. '
                'He was the youngest of seven children, and his father, Leopold Mozart, was a musician and composer in the service of the Archbishop of Salzburg.\n\n'
                'Mozart showed remarkable musical talent at a very young age. '
                'By the time he was three years old, he was playing the keyboard and composing his own music. '
                'He and his older sister, Nannerl, were often sent on concert tours by their father, performing for audiences throughout Europe and earning great acclaim for their virtuosic playing.\n\n'
                'At the age of six, Mozart began formal music lessons with his father, who was a strict and demanding teacher. '
                'However, Mozart\'s talent was so great that he quickly outstripped his father\'s teaching and began to develop his own unique style.\n',
                style: TextStyle(fontSize: 18),
              ),
              Image.asset('assets/images/MozartLearning.png'),
              const Text(
                '\nDespite his success as a child prodigy, Mozart\'s childhood was not always easy.'
                'He and his family often faced financial difficulties, and they were frequently on the move, traveling from one city to another to perform for wealthy patrons. '
                'Mozart\'s mother, Anna Maria, died when he was just 14 years old, and he was left to cope with his grief while continuing to pursue his music career.'
                '\n\nDespite these challenges, Mozart continued to compose music of extraordinary beauty and complexity. '
                'His early works, such as his piano sonatas and string quartets, were marked by their elegance, grace, and emotional depth.'
                '\n\nAs Mozart entered his teenage years, he began to establish himself as a composer and performer in his own right. '
                'He wrote operas, symphonies, and chamber music, and he became known throughout Europe for his innovation and his technical skill. '
                'In 1770, at the age of just 14, he was appointed as the concertmaster of the Archbishop of Salzburg\'s orchestra, making him one of the youngest musicians ever to hold such a position.',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                'Career & Late Life',
                style: TextStyle(fontSize: 32),
              ),
              Image.asset('assets/images/MozartComposing.png'),
              const Text(
                "\nAs Mozart progressed into his teenage years, he continued to hone his musical abilities and establish himself as both a composer and performer. "
                "At the age of just 14, he became the concertmaster of the Archbishop of Salzburg's orchestra - one of the youngest musicians ever to hold such a position. \n\n"
                "Though he had achieved success in Salzburg, Mozart yearned to establish himself as an independent composer rather than solely a performer. "
                "In 1777, he left Salzburg for Mannheim, which was a hub of musical activity during that time. "
                "It was in Mannheim that he fell in love with Aloysia Weber, a singer and daughter of a notable musical family. \n\n"
                "Mozart and Aloysia were then engaged, but unfortunately, the relationship ultimately ended, partially due to Mozart's father's disapproval. "
                "Despite the heartbreak, Mozart continued to compose beautiful and complex music."
                " \n\nIn 1781, Mozart received a commission to compose an opera for the National Theater in Vienna. "
                "\"Idomeneo,\" the opera he composed, was a huge success, which led to further commissions and cemented his position as one of the leading composers of his time. "
                "\n\nThroughout the 1780s, Mozart composed operas, symphonies, chamber music, and concertos that were both accessible to the general public and intellectually challenging for advanced listeners. "
                "However, financial difficulties plagued him throughout his life, and he often had to rely on commissions and patronage to make ends meet. \n\n"
                "Even still, Mozart left an enduring legacy with his works such as \"The Marriage of Figaro,\" his \"Jupiter\" Symphony, and his Requiem Mass. "
                "\n\nMozart died on December 5, 1791, at the age of 35, due to a fever and possibly kidney failure."
                " Even though his life was relatively short, Mozart's impact on the world of music remains unparalleled, and his music continues to be celebrated and performed to this day.\n",
                style: TextStyle(fontSize: 18),
              ),
              Image.asset('assets/images/MozartGrave.png'),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/main'),
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
