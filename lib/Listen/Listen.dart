import 'package:artifact/bottom_navigation_bar/bottom_button_bar.dart';
import 'package:artifact/common_ui_components/default_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:artifact/bottom_navigation_bar/circular_dial_menu.dart';
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
      extendBodyBehindAppBar: true,
      appBar: DefaultAppBar.build(context),
      backgroundColor: const Color.fromRGBO(201, 200, 244, 1.0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(142, 148, 219, 1.0),
                    width: 5,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/beethoven');
                  },
                  child: Image.asset('assets/images/Beethoven.PNG'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
                    foregroundColor: Color.fromRGBO(0, 0, 0, 1.0),
                    side: BorderSide(
                      width: 5.0,
                      color: Color.fromRGBO(142, 148, 219, 1.0),
                    ),
                    elevation: 5,
                    //fixedSize: Size:,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/beethoven');
                  },
                  child: const Text(
                    'Ludwig van Beethoven',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              StreamBuilder<SequenceState?>(
                stream: openingState.getPlayer.sequenceStateStream,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  if (state?.sequence.isEmpty ?? true) {
                    return const Text('');
                  } else {
                    return Text(
                      state!.currentSource!.tag.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.black),
                      textAlign: TextAlign.center,
                    );
                  }
                },
              ),
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CircularDialMenu.build(context),
      bottomNavigationBar: BottomButtonBar.build(context),
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
              Text(
                '${snapshot.data?.toStringAsFixed(1)}$valueSuffix',
                style: const TextStyle(
                  fontFamily: 'Fixed',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
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
    setState(
      () {
        dynamicText = 'This is new text value';
        // Replace with your logic
      },
    );
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
