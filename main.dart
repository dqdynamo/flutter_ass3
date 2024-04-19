import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyMusicPlayer());
}

class MyMusicPlayer extends StatelessWidget {
  const MyMusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer _player = AudioPlayer();
  List<PlatformFile> _files = [];

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );
    if (result != null) {
      setState(() {
        _files = result.files;
      });
    }
  }

  void _playMusic([int? index]) async {
    try {
      if (index != null) {
        await _player.setFilePath(_files[index].path!);
      }
      await _player.play();
    } catch (e) {
      print('Error playing music: $e');
    }
  }

  void _pauseMusic() {
    _player.pause();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Music Player'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _selectFile,
            child: const Text('Select Music'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _files.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_files[index].name),
                  onTap: () => _playMusic(index),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _playMusic,
                child: const Text('Play'),
              ),
              ElevatedButton(
                onPressed: _pauseMusic,
                child: const Text('Pause'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
