import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'Listen/Listen.dart';
import 'package:just_audio/just_audio.dart';

class opening extends StatefulWidget {
  const opening({super.key});

  @override
  State<opening> createState() => openingState();
}

class openingState extends State<opening> {
  static AudioPlayer audioPlayer = AudioPlayer();

  final beethovenPlaylist = ConcatenatingAudioSource(
    children: [
      AudioSource.uri(
        Uri.parse('asset:///assets/music/Beethoven/Fur_Elise.mp3'),
        tag: 'Für Elise',
      ),
      AudioSource.uri(
        Uri.parse(
            'asset:///assets/music/Beethoven/Sonata_8_Pathetique_1st_Movement.mp3'),
        tag: 'Sonata 8 Pathetique 1st Movement',
      ),
      AudioSource.uri(
        Uri.parse(
            'asset:///assets/music/Beethoven/Moonlight_Sonata_1st_Movement.mp3'),
        tag: 'Moonlight Sonata 1st Movement',
      ),
      AudioSource.uri(
        Uri.parse(
            'asset:///assets/music/Beethoven/Sonata_1_in_F_Minor_Allegro.mp3'),
        tag: 'Sonata 1 in F Minor Allegro',
      ),
    ],
  );

  static AudioPlayer get getPlayer {
    return audioPlayer;
  }

  void mute() {
    audioPlayer.setVolume(0);
  }

  void unmute() {
    audioPlayer.setVolume(1);
  }

  String get songName {
    return audioPlayer.sequenceState?.currentSource?.tag;
  }

  @override
  void initState() {
    super.initState();
    //audioPlayer..setAsset('asset:///assets/music/Beethoven/Sonata_1_in_F_Minor_Allegro.mp3');
    audioPlayer.setLoopMode(LoopMode.all);
    audioPlayer.setAudioSource(beethovenPlaylist);
    // _init();
  }

  // Future<void> _init() async {
  //   audioPlayer.setLoopMode(LoopMode.all);
  //   audioPlayer.setAudioSource(beethovenPlaylist);
  //   audioPlayer.play;
  // }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 214, 153, 1),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/test.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 150),
              Align(
                alignment: Alignment.bottomCenter,
                child: FadeInDown(
                    duration: Duration(seconds: 4), child: topButton()),
                // TextButton(
                //   onPressed: () => Navigator.pushNamed(context, '/main'),
                //   child: const Text('Go To Home', style: TextStyle(fontSize: 30, color: Colors.orangeAccent)),
                // )
              ),
              const SizedBox(height: 100),
              Controls(player: audioPlayer),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(65, 0, 70, 70),
              //   child: Image.asset('assets/images/music_box.png', scale: 2.6),
              // ),
              const SizedBox(height: 100),
              Align(
                alignment: Alignment.center,
                child: FadeInUp(
                    duration: Duration(seconds: 4), child: bottomButton()),
                // TextButton(
                //   onPressed: () => Navigator.pushNamed(context, '/works'),
                //   child: const Text('What Am I Listening To?', style: TextStyle(fontSize: 30, color: Colors.orangeAccent)),
                // )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class topButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        color: const Color.fromRGBO(255, 255, 255, 1.0),
        padding: const EdgeInsets.all(25),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
          child: const Text(
            'Go To Home',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class bottomButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        color: const Color.fromRGBO(255, 255, 255, 1.0),
        padding: const EdgeInsets.all(25),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/listen');
          },
          child: const Text(
            'What Am I Listening To?',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
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

class MediaMetadata extends StatelessWidget {
  const MediaMetadata({
    super.key,
    required this.title,
    required this.artist,
  });

  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 25, color: Colors.black),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          artist,
          style: TextStyle(fontSize: 25, color: Colors.black),
          textAlign: TextAlign.center,
        )
      ],
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
          },
        ),
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
          },
        ),
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
