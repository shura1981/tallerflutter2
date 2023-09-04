import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../widgets/menu.dart';

const oneSec = Duration(seconds:1);
const interval = Duration(minutes: 1);
const iconCancel = Icons.cancel;
const iconStart = Icons.alarm;
const alarmAudioPath = 'sound_alarm.mp3';

class StreamScreen extends StatelessWidget {
  static AudioPlayer  player = AudioPlayer();
  
  const StreamScreen({Key? key}) : super(key: key);
  pause(int seconds) => Future.delayed(Duration(seconds: seconds));
  Stream<int> countDown(int from, int to) async* {
    await pause(3);
    yield from;
    for (int i = from - 1; i >= to; i--) {
      await pause(1);
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(title: const Text('Stream')),
      body: StreamBuilder(
        stream: countDown(5, 0),
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasError) {
            return  Center(
              child: Text('Ocurrió un error ${snapshot.error.toString()}'),
            );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: Text('Sin datos para mostrar'),
              );
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return Center(
                child: Text(
                  snapshot.data.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
              );
            case ConnectionState.done:
            {
              player.play(AssetSource(alarmAudioPath));
               return const Center(
                child: Text('Terminado...'),
              );
            }
             
          }
        },
      ),
    );
  }
}
