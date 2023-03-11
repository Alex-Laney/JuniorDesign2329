import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';

class BachScreen extends StatelessWidget {
  const BachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 246, 167, 1),
      appBar: AppBar(
        title: const Text('Bach'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Image.asset('assets/images/Bach.png'),
              const Text('Early Life',
                style: TextStyle(fontSize: 32),),
              const Text("Johann Sebastian Bach was born on March 31, 1685, in Eisenach, Germany, into a family of musicians. "
                  "His father, Johann Ambrosius Bach, was a court trumpeter, and his mother, Maria Elisabeth Lämmerhirt, came from a family of musicians. "
                  "Bach was the youngest of eight children, and his parents died when he was just ten years old, leaving him and his siblings to be raised by their older brother, Johann Christoph."
                  "\n\nUnder his brother's guidance, Bach received his early musical education and showed a remarkable talent for music from an early age. "
                  "He learned to play the violin and the harpsichord, and by the age of ten, he was already proficient enough to join his brother's orchestra."
                  "\n\nBach's musical education continued when he was sent to study at the prestigious St. Michael's School in Lüneburg when he was 15. "
                  "It was here that he was exposed to a wide variety of musical styles, and he studied under the renowned organist and composer Georg Böhm. "
                  "Bach was so skilled that he was often called upon to substitute for Böhm when he was unavailable."
                  "\n",
                style: TextStyle(fontSize: 18),
              ),
              Image.asset('assets/images/BachPlaying.png'),
              const Text("After completing his studies in Lüneburg, Bach began his professional career as a musician. "
              "He secured his first job as a court musician in Weimar at the age of 18, and it was here that he began to establish himself as a composer. "
                  "During his time in Weimar, he wrote some of his earliest compositions, including organ works and cantatas."
                  "\n\nIn 1717, Bach accepted a position as the court organist and chamber musician for Prince Leopold of Anhalt-Köthen. "
                  "Here, he was free to focus on instrumental music, and he composed some of his most famous instrumental works, including his Brandenburg Concertos, his suites for solo cello and solo violin, and the Goldberg Variations.\n",
                style: TextStyle(fontSize: 18),
              ),
              const Text('Career & Late Life',
                style: TextStyle(fontSize: 32),),
              const Text("After his time in Köthen, Bach moved to Leipzig in 1723, where he spent the remainder of his life as the director of music at the St. Thomas Church and School. "
                  "This position was both prestigious and challenging, as Bach was responsible for composing music for the church's weekly services, directing the choir and orchestra, and teaching music to the school's students."
                  "\n\nDuring his time in Leipzig, Bach composed some of his most famous works, including the St. Matthew Passion and the Mass in B Minor. "
                  "He also continued to write cantatas and other sacred music, as well as instrumental works for the keyboard and other instruments."
                  "\n\nBach's musical output was vast and varied, and he was a master of many different genres and styles. "
                  "He was renowned for his complex and intricate counterpoint, his skillful use of harmony and melody, and his ability to convey a wide range of emotions through his music."
                  "\n\nDespite his many accomplishments, Bach was not widely recognized as a great composer during his lifetime. "
                  "It was not until several decades after his death on July 28, 1750 that his music began to be appreciated by a wider audience, and he is now considered one of the greatest composers of all time."
                  "\n\nBach's legacy continues to live on today, and his music is still widely performed and studied. "
                  "His influence can be heard in the works of countless composers who came after him, and his contributions to music have had a profound impact on the development of Western classical music.\n",
                style: TextStyle(fontSize: 18),
              ),
              Image.asset('assets/images/BachGrave.png'),
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
