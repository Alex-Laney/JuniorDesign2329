import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:artifact/circular_dial_menu.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import '../music_box.dart';

class ListenScreen extends StatefulWidget {
  const ListenScreen({super.key});

  @override
  ListenScreenState createState() => ListenScreenState();
}

class ListenScreenState extends State<ListenScreen> {
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        openingState.getPlayer.positionStream,
        openingState.getPlayer.bufferedPositionStream,
        openingState.getPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  //String title = openingState.getPlayer.sequenceState?.currentSource?.tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(201, 200, 244, 1.0),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(),//onPressed: ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(142, 148, 219, 1.0),
                  width: 5,
                ),
              ),
              child: Image.asset('assets/images/Beethoven.PNG'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
                    foregroundColor: Color.fromRGBO(0, 0, 0, 1.0),
                    side: BorderSide(width: 5.0, color: Color.fromRGBO(142, 148, 219, 1.0)),
                    elevation: 5,
                    //fixedSize: Size:,
                  ),
                onPressed: () {
                  Navigator.pushNamed(context, '/beethoven');
                },
                child: const Text('Ludwig van Beethoven', style: TextStyle(fontSize: 20, color: Colors.black)),
              )
            ),
            Text(openingState.getPlayer.sequenceState?.currentSource?.tag,
              style: TextStyle(fontSize: 30, color: Colors.black), textAlign:
              TextAlign.center,),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 30, 60, 0),
              child: StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return ProgressBar(
                    barHeight: 8,
                    baseBarColor: Colors.black,
                    bufferedBarColor: Colors.grey,
                    progressBarColor: Colors.red,
                    thumbColor: Colors.red,
                    timeLabelTextStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    progress: positionData?.position ?? Duration.zero,
                    buffered: positionData?.bufferedPosition ?? Duration.zero,
                    total: positionData?.duration ?? Duration.zero,
                    onSeek: openingState.getPlayer.seek,
                  );
                },
              ),
            ),
            Controls(player: openingState.getPlayer),
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
              onPressed: () => {
                Navigator.pushNamed(context, '/main'),
              },
              tooltip: 'Home',
              icon: const Icon(Icons.home, color: Colors.black45),
            ),
            IconButton(
              onPressed: () => {
                Navigator.pushNamed(context, '/settings'),
              },
              tooltip: 'Settings',
              icon: const Icon(Icons.settings, color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}

void showSliderDialog({
  required BuildContext context,
  required String title,
  required int divisions,
  required double min,
  required double max,
  String valueSuffix = '',
  // TODO: Replace these two by ValueStream.
  required double value,
  required Stream<double> stream,
  required ValueChanged<double> onChanged,
}) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      content: StreamBuilder<double>(
        stream: stream,
        builder: (context, snapshot) => SizedBox(
          height: 100.0,
          child: Column(
            children: [
              Text('${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                  style: const TextStyle(
                      fontFamily: 'Fixed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0)),
              Slider(
                divisions: divisions,
                min: min,
                max: max,
                value: snapshot.data ?? value,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class TextChanger extends StatefulWidget {
  const TextChanger({super.key});
  @override
  State<TextChanger> createState() => _TextChangerState();
}
class _TextChangerState extends State<TextChanger> {
  // Declare the variable
  String dynamicText = 'Initial Text';
  updateText() {
    setState(() {
      dynamicText = 'This is new text value';
      // Replace with your logic
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$dynamicText', // Dynamic text
          style: const TextStyle(fontSize: 28),
        ),
        ElevatedButton(
          child: const Text('Change Text'),
          onPressed: () => updateText(), // Call the method
        ),
      ],
    );
  }
}