import 'package:flutter/material.dart';
import 'package:artifact/circular_dial_menu.dart';

class BeethovenScreen extends StatelessWidget {
  const BeethovenScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 246, 167, 1),
      appBar: AppBar(
        title: const Text('Beethoven'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[Image.asset('assets/images/Beethoven.PNG'),
              const Text('Early Life',
              style: TextStyle(fontSize: 32),),
              const Text('Ludwig van Beethoven was born on December 16, 1770, in the city of Bonn, Germany. '
                'He was the second oldest of seven children, and his father, Johann van Beethoven, was a singer and musician in the local court orchestra while Beethoven\'s mother, Maria Magdalena Keverich, came from a family of cooks and servants. '
                '\n\nBeethoven\'s musical talent was recognized at a young age, and he began taking music lessons from his father and other local teachers. '
                'By the age of eight, he was already playing the violin and the piano, and he began composing his own music. '
                'In 1787, when Beethoven was just 17 years old, he made his first trip to Vienna, which was known as musical capital of Europe, to study with the famous composer Joseph Haydn. '
                'Beethoven had already composed a number of works, including a piano trio and a set of piano variations, and he was eager to learn from the best. '
                '\n\nDuring his time in Vienna, Beethoven studied with several other prominent musicians, including Johann Georg Albrechtsberger and Antonio Salieri. '
                'He also performed as a pianist in public concerts, often playing his own compositions. '
                '\n\nDespite his early success, Beethoven faced many challenges in his personal life. '
                'His father was an alcoholic who often beat him and his siblings, and his mother died when he was just 16 years old. '
                'Beethoven was left to care for his younger brothers, and he struggled to support his family while pursuing his music career. ',
                style: TextStyle(fontSize: 18),
              ),
              const Text('Career & Late Life',
              style: TextStyle(fontSize: 32),),
              const Text('After studying with several prominent musicians in Vienna, Beethoven established himself as a successful composer and performer. '
                  'He began to receive commissions from wealthy patrons, including members of the nobility, and he became known throughout Europe for his innovative compositions and virtuosic piano playing. '
                  '\n\nIn the early 1800s, Beethoven began to experience hearing loss, a condition that would eventually lead to his complete deafness. '
                  'This was a devastating blow for Beethoven, as he was a musician who relied on his ability to hear to create his music. '
                  'However, he continued to compose music, using his memory and imagination to create beautiful melodies. '
                  'During this time, Beethoven wrote some of his most famous works, including his Fifth Symphony, his Moonlight Sonata, and his Ninth Symphony, which includes the famous "Ode to Joy" melody. '
                  'These compositions are known for their emotional depth, their complexity, and their innovative use of form and structure. '
                  '\n\nIn addition to his music, Beethoven was known for his strong personality and his commitment to social and political causes. '
                  'He was a supporter of the French Revolution and of democratic ideals, and his music often expressed these ideals through its grandeur and power. '
                  '\n\nDespite his growing fame and success, Beethoven continued to face personal challenges. '
                  'He had difficulty maintaining relationships with friends and family members, and he struggled with depression and feelings of isolation. He also faced financial difficulties, as his health problems made it difficult for him to perform and to earn a steady income. '
                  '\n\nBeethoven died on March 26, 1827, at the age of 56. He was buried in a cemetery in Vienna, where his grave can still be visited today. '
                  'He left behind a legacy of beautiful and influential music that continues to inspire and delight people all over the world.\n',
                style: TextStyle(fontSize: 18),
              ),
              Image.asset('assets/images/BeethovenGrave.png'),
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
