import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongPlaying extends StatefulWidget {
  const SongPlaying({super.key});

  @override
  State<SongPlaying> createState() => _SongPlayingState();
}

class _SongPlayingState extends State<SongPlaying> {
  double _sliderValue = 0.2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 35,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Column(
            children: const [
              Text(
                'PLAYING FROM YOUR LIBRARY',
                style: TextStyle(
                    color: Colors.white, fontSize: 11, letterSpacing: 1),
              ),
              Text(
                'Liked Songs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          actions: [
            IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(
                  // width: MediaQuery.of(context).size.width - 60,
                  'assets/images/thumbnail 3.jpg')),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Take That',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Patience',
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  )
                ],
              ),
              Column(
                children: [
                  SliderTheme(
                    data: const SliderThemeData(
                        trackHeight: 2,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 5),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 0)),
                    child: Slider(
                      thumbColor: Colors.white,
                      inactiveColor: Colors.grey.shade700,
                      value: _sliderValue,
                      onChanged: ((value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      }),
                      activeColor: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1:01',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade300),
                      ),
                      Text(
                        '4:50',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade300),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.backward_end_fill,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.forward_end_fill,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.stop_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.headphones,
                          color: Colors.greenAccent.shade700)),
                  Expanded(
                      child: Text(
                    'ROCKERZ 235V2',
                    style: TextStyle(
                        color: Colors.greenAccent.shade700,
                        letterSpacing: 0.8,
                        fontSize: 10),
                  )),
                  IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined,
                          color: Colors.white)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      splashRadius: 20,
                      onPressed: () {},
                      icon: const Icon(Icons.menu, color: Colors.grey))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
