import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:artifact/circular_dial_menu.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class ListenScreen extends StatefulWidget {
  const ListenScreen({super.key});

  @override
  ListenScreenState createState() => ListenScreenState();
}

class ListenScreenState extends State<ListenScreen> {
  late AudioPlayer _audioPlayer;

  final beethovenPlaylist = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
          Uri.parse('asset:///assets/music/Beethoven/Fur_Elise.mp3')),
      AudioSource.uri(Uri.parse(
          'asset:///assets/music/Beethoven/Sonata_8_Pathetique_1st_Movement.mp3')),
      AudioSource.uri(Uri.parse(
          'asset:///assets/music/Beethoven/Moonlight_Sonata_1st_Movement.mp3')),
      AudioSource.uri(Uri.parse(
          'asset:///assets/music/Beethoven/Sonata_1_in_F_Minor_Allegro.mp3')),
    ],
  );

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(beethovenPlaylist);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(196, 236, 249, 1),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: BackButton(),
            ),
            Image.asset('assets/images/Beethoven.PNG'),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/beethoven');
                },
                child: const Text('Ludwig van Beethoven'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 50, 60, 0),
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
                    onSeek: _audioPlayer.seek,
                  );
                },
              ),
            ),
            Controls(player: _audioPlayer),
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
                Navigator.pushNamed(context, '/'),
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

class Controls extends StatelessWidget {
  const Controls({
    super.key,
    required this.player,
  });

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: const Icon(Icons.skip_previous),
            iconSize: 60,
            onPressed: () async {
              await player.seekToPrevious();
            }),
        StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (!(playing ?? false)) {
                return IconButton(
                  icon: const Icon(Icons.play_arrow_rounded),
                  iconSize: 80,
                  onPressed: player.play,
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: const Icon(Icons.pause),
                  iconSize: 80,
                  onPressed: player.pause,
                );
              }
              return IconButton(
                icon: const Icon(Icons.pause),
                iconSize: 80,
                onPressed: player.pause,
              );
            }),
        IconButton(
          icon: const Icon(Icons.skip_next),
          iconSize: 60,
          onPressed: () => player.seekToNext(),
        ),
        IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0.0,
              max: 1.0,
              value: player.volume,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        )
      ],
    );
  }
}

class PositionData {
  const PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );

  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
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
