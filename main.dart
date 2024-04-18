import 'package:flutter/material.dart';

void main() {
  runApp(const MyMusicPlayer());
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

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Music Player'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Album Cover (настроенный размер в зависимости от ширины экрана)
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.grey, // Placeholder for album cover
            margin: const EdgeInsets.all(20),
          ),
          // Song Title
          const Text(
            'Song Title',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Artist Name
          const Text(
            'Artist Name',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          // Progress Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Slider(
              value: 0.5, // Placeholder value for progress
              onChanged: (newValue) {
                // Update playback progress
              },
              min: 0,
              max: 1,
              activeColor: Colors.blue,
            ),
          ),
          // Playback Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shuffle),
                onPressed: () {
                  // Handle shuffle
                },
              ),
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: () {
                  // Handle skip to previous song
                },
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {
                  // Handle play/pause
                },
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: () {
                  // Handle skip to next song
                },
              ),
              IconButton(
                icon: const Icon(Icons.repeat),
                onPressed: () {
                  // Handle repeat
                },
              ),
            ],
          ),
          // Volume Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.volume_down),
              Slider(
                value: 0.5, // Placeholder value for volume
                onChanged: (newValue) {
                  // Update volume
                },
                min: 0,
                max: 1,
                activeColor: Colors.blue,
              ),
              const Icon(Icons.volume_up),
            ],
          ),
          // Time Indicator
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0:00'), // Placeholder for current time
              Text('3:45'), // Placeholder for total duration
            ],
          ),
        ],
      ),
    );
  }
}
